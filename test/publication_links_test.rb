require 'minitest/autorun'
require 'liquid'
require 'bibtex'
require 'nokogiri'

class PublicationLinksTest < Minitest::Test
  def setup
    root = File.expand_path('..', __dir__)
    @catalog = BibTeX::Bibliography.parse(File.read(File.join(root, '_bibliography', 'papers.bib')))
    layout = File.read(File.join(root, '_layouts', 'bib.liquid'))
    @links = Liquid::Template.parse(layout.match(/<div class="links">.*?<\/div>/m)[0])
  end

  def test_requested_arxiv_links_are_rendered
    {
      'jiang2025financialsentimentanalysisusing' => '2306.02136',
      'zeng2025tamingsqlcomplexityllmbased' => '2506.09359',
      'Zeng2026geometricgroupoids' => '2609.28220'
    }.each do |key, identifier|
      assert_link render_entry(key), "https://arxiv.org/abs/#{identifier}", 'arXiv'
    end
  end

  def test_zerotuning_has_its_workshop_openreview_link
    assert_link render_entry('han2025zerotuning'), 'https://openreview.net/forum?id=THSbsRWy9v', 'OpenReview'
  end

  def test_waterrag_has_a_journal_link_and_keeps_its_doi
    links = render_entry('zhai2026waterrag')
    assert_link links, 'https://pubs.acs.org/doi/10.1021/acs.est.5c15806', 'Journal'
    assert_link links, 'https://doi.org/10.1021/acs.est.5c15806', 'DOI'
  end

  def test_unprovided_resource_links_are_not_guessed
    links = render_links({ 'eprint' => 'In preparation', 'url' => 'https://example.org/' })
    assert_empty links.css('a')
  end

  def test_thesis_keeps_its_distinct_arxiv_and_dissertation_links
    links = render_entry('upenn2022derived')
    assert_link links, 'https://arxiv.org/abs/2210.05856', 'arXiv'
    assert_link links, 'https://repository.upenn.edu/handle/20.500.14332/31917', 'Dissertation'
  end

  def test_openreview_query_parameters_are_escaped_in_html
    url = 'https://openreview.net/forum?id=paper&noteId=review'
    output = @links.render!('entry' => { 'openreview' => url }, 'type' => 'misc')
    assert_includes output, 'id=paper&amp;noteId=review'
    assert_link Nokogiri::HTML.fragment(output), url, 'OpenReview'
  end

  private

  def render_entry(key)
    entry = @catalog[key]
    refute_nil entry, "Missing bibliography entry #{key}"
    fields = entry.fields.transform_keys(&:to_s).transform_values(&:to_s)
    render_links(fields, entry.type.to_s)
  end

  def render_links(entry, type = 'misc')
    Nokogiri::HTML.fragment(@links.render!('entry' => entry, 'type' => type))
  end

  def assert_link(document, url, label)
    links = document.css('a').select { |link| link['href'] == url }
    assert_equal 1, links.length, "Expected one #{label} link to #{url}"
    assert_equal label, links.first.text.strip
  end
end

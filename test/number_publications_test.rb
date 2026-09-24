require 'minitest/autorun'
require 'liquid'
require 'bibtex'
require_relative '../_plugins/number-publications'

class NumberPublicationsTest < Minitest::Test
  include Jekyll::NumberPublications

  def test_catalog_entries_have_one_supported_subject_and_secondary_topics
    root = File.expand_path('..', __dir__)
    page = File.read(File.join(root, '_pages', 'publications.md'))
    subjects = page.scan(/research_area=([a-z-]+)/).flatten
    refute_empty subjects
    assert_equal subjects.uniq, subjects

    catalog = BibTeX::Bibliography.parse(File.read(File.join(root, '_bibliography', 'papers.bib')))
    entries = catalog['@*'].grep(BibTeX::Entry)
    refute_empty entries
    entries.each do |entry|
      assert_includes subjects, entry[:research_area].to_s, entry.key
      refute_empty entry[:keywords].to_s, entry.key
    end
    aliases = entries.flat_map { |entry| entry[:ids].to_s.split(',').map(&:strip) }
    assert_equal aliases.uniq, aliases
    assert_empty entries.map(&:key) & aliases
  end

  def test_numbering_continues_across_subjects_and_years
    input = <<~HTML
      <section>
        <h2>Mathematics</h2>
        <h3 class="bibliography">2026</h3>
        <ol class="bibliography"><li id="first">First</li><li id="second">Second</li></ol>
        <h3 class="bibliography">2025</h3>
        <ol class="bibliography"><li id="third">Third</li></ol>
      </section>
      <section>
        <h2>Language Models</h2>
        <ol class="bibliography"><li id="fourth">Fourth</li></ol>
      </section>
    HTML

    document = Nokogiri::HTML.fragment(number_publications(input))
    assert_equal %w[1 2 3 4], document.css('ol.bibliography > li').map { |item| item['value'] }
    assert_equal %w[1 3 4], document.css('ol.bibliography').map { |list| list['start'] }
    assert_equal %w[first second third fourth], document.css('ol.bibliography > li').map { |item| item['id'] }
  end

  def test_unrelated_and_nested_lists_do_not_advance_the_index
    input = <<~HTML
      <ol><li>Navigation</li></ol>
      <ol class="bibliography">
        <li><a href="/paper/">Paper</a><ol><li>Abstract detail</li></ol></li>
        <li>Another paper</li>
      </ol>
    HTML

    document = Nokogiri::HTML.fragment(number_publications(input))
    assert_equal %w[1 2], document.css('ol.bibliography > li').map { |item| item['value'] }
    assert_nil document.at_css('ol:not(.bibliography) > li')['value']
    assert_nil document.at_css('li ol li')['value']
    assert_equal '/paper/', document.at_css('a')['href']
  end

  def test_each_render_starts_at_one_and_replaces_old_values
    input = '<ol class="bibliography" start="20"><li value="20">Paper</li></ol>'
    2.times do
      document = Nokogiri::HTML.fragment(number_publications(input))
      assert_equal '1', document.at_css('ol')['start']
      assert_equal '1', document.at_css('li')['value']
    end
    assert_empty Nokogiri::HTML.fragment(number_publications('')).css('li')
  end
end

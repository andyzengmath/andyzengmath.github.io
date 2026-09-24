require 'nokogiri'

module Jekyll
  module NumberPublications
    def number_publications(input)
      fragment = Nokogiri::HTML.fragment(input)
      index = 0

      fragment.css('ol.bibliography').each do |list|
        list['start'] = (index + 1).to_s
        list.element_children.select { |element| element.name == 'li' }.each do |item|
          index += 1
          item['value'] = index.to_s
        end
      end

      fragment.to_html
    end
  end
end

Liquid::Template.register_filter(Jekyll::NumberPublications)

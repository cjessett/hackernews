
class Page
  attr_reader :document

  def initialize(html_document)
    @document = html_document
  end

  def title
    document.css('title').text
  end

  def links
    links = {}
    document.css('a').each do |link|
      links[link.text] = link.attributes['href'].value
    end
    links.select { |text, url| url[0..3] == 'http' }
  end

  def character_count
    document.css('body').text.gsub(/\s+/,"").length
  end
end


require 'httparty'
require 'nokogiri'
require 'pry'

require_relative 'page'

if ARGV.any?
  url = ARGV.first
else
  url = 'https://news.ycombinator.com/'
end

response = HTTParty.get(url)

parsed = Nokogiri.parse(response)

page = Page.new(parsed)

puts <<END
#{page.title}
#{url}

Content length: #{page.character_count.to_s}.

Links:
END

page.links.each do |text, url|
  puts "- #{text}"
  puts "  #{url}\n\n"
end

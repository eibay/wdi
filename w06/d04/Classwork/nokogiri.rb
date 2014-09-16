require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.reddit.com'))

# doc.css('a.title').each do |link|
# 	puts link.content
# end

# doc.css('span.domain').each do |link|
# 	puts link
# end

snippet = {"title" => doc.css('a.title')[0].content, "link" => doc.css('a.href')[0]}

puts snippet
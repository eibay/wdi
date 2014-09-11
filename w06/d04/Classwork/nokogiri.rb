require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://www.reddit.com/"))

data = []
doc.css('a.title').each do | title |

data << title

end

puts data



# doc.xpath('//title/a').each do |node|
#       puts node.text
#     end
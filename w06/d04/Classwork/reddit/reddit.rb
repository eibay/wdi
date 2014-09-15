require 'sinatra'
require 'sinatra/reloader'
require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open('http://www.reddit.com/'))

reddit=[]

doc.search('a.title').each do |link|

puts link.content

end


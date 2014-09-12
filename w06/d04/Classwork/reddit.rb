require 'nokogiri'
require 'open-uri'
require 'sinatra'
require 'sinatra/reloader'
require 'JSON'

doc = Nokogiri::HTML(open('http://www.reddit.com'))

doc.css('a.title').each do |link|
puts link.
end


require 'sinatra'
require 'json'
require 'pry'
require 'httparty'
require 'nokogiri'

get "/" do
  html = HTTParty.get("http://www.nytimes.com/")
  parsed = Nokogiri::HTML(html)

  headlines = []

  parsed.css("h2.story-heading a").each do |element|
    headlines << { title: element.text, link: element.attr("href") }
  end

  headlines.to_json
end

# binding.pry
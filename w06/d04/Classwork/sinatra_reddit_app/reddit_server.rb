require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'nokogiri'
require 'httparty'

get("/reddit") do

  parsed_data_reddit = HTTParty.get('http://www.reddit.com')

  parsed = Nokogiri::HTML(parsed_data_reddit)

  array = []

  parsed.css('a.title').each do |p|
      hash  = {
        title: p.text,
        link: p["href"]
      }

      array << hash
  end

  array.to_json

end
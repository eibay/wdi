require 'sinatra'
require 'nokogiri'
require 'HTTParty'
require 'open-uri'
require 'json'

get "/" do
  reddit = HTTParty.get('http://www.reddit.com')
  reddit_doc = Nokogiri::HTML(reddit)

  reddit_hash = {}
  reddit_stuffs = []
  reddit_doc.css('a.title').each do |link|
    reddit_hash[:title] = link.content
    reddit_hash[:link] = link["href"]
    reddit_stuffs << reddit_hash
  end

  JSON.generate(reddit_hash)

  # erb(:index, locals: {reddit_doc: reddit_doc})
end

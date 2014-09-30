require 'sinatra'
require 'httparty'
require 'pry'
require 'uri'

get "/" do
 erb(:index) 
end

get "/booknamestuff/:book" do
  book = URI.encode(params[:book])
  doc = HTTParty.get("https://www.goodreads.com/book/title?format=FORMAT&title=#{book}&key=3pjNVCasTGsbmq2JZVU1yA")
  doc = doc.to_json
  return doc
end

 


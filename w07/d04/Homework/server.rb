require 'sinatra'
require 'json'
require 'httparty'
require 'uri'

get '/' do
  content_type :json
  tag = params[:tag]
  url = URI.encode("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")
  pictures = HTTParty.get(url)

  pictues.response.body

end






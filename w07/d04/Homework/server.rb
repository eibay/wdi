require 'httparty'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'uri'




get '/' do
  erb(:index)
end

get '/monkey' do 
  content_type :json

  search = params["search"]
  api_url = HTTParty.get(URI.encode('https://api.instagram.com/v1/tags/#{search}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01'))

  api_url.response.body

end
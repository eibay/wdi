require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get '/' do 
	erb(:index)
end

get '/word' do 
	content_type :json
	word_req = HTTParty.get('http://randomword.setgetgo.com/get.php')
	word = word_req.split()[0]
end


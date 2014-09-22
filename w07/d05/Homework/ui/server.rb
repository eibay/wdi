require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

get '/' do

  erb(:index)
end

get '/new_word' do

  url = 'http://randomword.setgetgo.com/get.php'
  word = HTTParty.get(url)

  word = word.split()[0]

end
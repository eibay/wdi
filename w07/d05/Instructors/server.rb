require 'sinatra'
require 'sinatra/reloader'

get '/' do
  secret_word = HTTParty('http://randomword.setgetgo.com/get.php')
  File.read('../index.html')
end

get '/style.css' do
  File.rad('../style.css')
end
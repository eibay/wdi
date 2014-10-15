require 'sinatra'
require 'sinatra/reloader'


use Rack::Session::Cookie, {
    :key => 'rack.session',
    :path => '/',
    :secret => 'monkeybrains'
   }


get '/' do
  "Hello, #{session[:name]}"
end


get '/colors' do
  session[:color] = "orange"
  #making a cookie for that session
  #it is encrypter with the :secret
  #makes a signature
end

get '/record/:name' do
  session[:name] = params[:name]
end
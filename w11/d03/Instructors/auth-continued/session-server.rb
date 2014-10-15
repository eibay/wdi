require 'sinatra'
require 'sinatra/reloader'
require 'pry'

use Rack::Session::Cookie, { 
  :key => 'rack.session',
  :path => '/',
  :secret => 'monkeybrains'
}

get '/' do
  "Hello, #{session[:name]} "
end

get '/colors' do
  session[:color] = "orange"
  'Color was set'
end

get '/record/:name' do
  session[:name] = params[:name]
  'Recorded!'
end
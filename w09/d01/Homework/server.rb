require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'redis'
require 'uri'

get '/' do
html = File.read('./index.html')
 return html
end

get '/skull' do
  html = File.read('./index.html')
  return html
end

get '/js/jquery.js' do
  js = File.read('./js/jquery.js')
  return js
end

get '/js/underscore.js' do
  js = File.read('./js/underscore.js')
  return js
end

get '/js/backbone.js' do
  js = File.read('./js/backbone.js')
  return js
end

get '/js/app.js' do
  js = File.read('./js/app.js')
  return js
end

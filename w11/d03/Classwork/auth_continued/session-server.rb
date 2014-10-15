require 'sinatra'
require 'sinatra/reloader'
require 'pry'

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'monkeybrains'

	} 

get '/' do
	'Hello, #{session[:name]}'
end

get '/colors' do
	session[:color] = "orange"
	"Color wuz set"
end

get '/record/:name' do
	session[:name] = params[:name]
	'Recorded!'
	# binding.pry
end


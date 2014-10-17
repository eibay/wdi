require 'sinatra'
require 'sinatra/reloader'
require 'faker'
require 'pry'

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'monkeybrains'
}

get '/' do 
	'Hello World'
	
end
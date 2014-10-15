require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative './connection.rb'
require_relative './models.rb'

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'theapricotdanishisthebestthing'
}


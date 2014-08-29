require 'sinatra'
require 'pry'
require_relative './model'

class Character < Model
	def show_info
		name = @attributes["name"]
		image = @attributes["image"]
	end 
end
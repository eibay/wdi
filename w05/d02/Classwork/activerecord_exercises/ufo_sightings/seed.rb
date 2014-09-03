require_relative './connection'
require 'json'
require 'pry'

class UFO < ActiveRecord::Base
end

data = JSON.parse(File.read('./ufo_formatted.json'))  

u.delete_all #used to prevent database duplication.

data.each do |x|
	u =UFO.new(x)
	u.save
end 

binding.pry
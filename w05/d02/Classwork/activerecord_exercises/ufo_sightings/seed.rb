require_relative './connection'
require 'json'
require 'pry'

class UFO < ActiveRecord::Base
end

data = JSON.parse(File.read("./ufo_formatted.json"))

UFO.delete_all

data.each do |d|
	UFO.create(d)
end

binding.pry
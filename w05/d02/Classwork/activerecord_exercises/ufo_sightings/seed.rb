require 'pry'
require 'active_record'
require_relative './connection'


class Sighting < ActiveRecord::Base
end

ufo_data = JSON.parse(File.read('./ufo_formatted.json'))
binding.pry

ufo_data.each do |ufohash|
	Sighting.create(ufohash)
end
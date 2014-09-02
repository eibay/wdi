require 'pry'
require 'json'
require 'active_record'
require_relative './connection.rb'



class Sighting < ActiveRecord::Base
end

ufos = JSON.parse(File.read('./ufo_formatted.json'))

sighting = Sighting.new

binding.pry

require_relative './connection'
require 'json'
require 'pry'

class Ufo < ActiveRecord::Base
end


ufo_data = JSON.parse(File.read('./ufo_formatted.json'))

ufo_data.each do |d|
  Ufo.create[d]
end

binding.pry
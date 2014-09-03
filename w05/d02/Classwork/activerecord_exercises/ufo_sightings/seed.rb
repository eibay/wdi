require 'pry'
require 'json'
require 'active_record'
require_relative './lib/ufo.rb'


data = JSON.parse(File.read('./ufo_formatted.json'))

Ufo.delete_all

data.each do |hash|
  u = Ufo.new(hash)
  u.save
end

binding.pry
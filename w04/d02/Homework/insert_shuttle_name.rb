require 'json'
require 'pry'

shuttles = JSON.parse(File.read('./astronauts.txt'))

binding.pry

require 'pry'
require 'json'

ufo = JSON.parse(File.read('./ufo_formatted.json'))
binding.pry
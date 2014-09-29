require 'pry'
require 'JSON'

x = JSON.parse(File.read('./public/ny-baby-names.json'))

binding.pry
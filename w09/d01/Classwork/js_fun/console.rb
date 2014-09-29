require 'pry'
require 'JSON'
require 'HTTParty'

x = HTTParty.get("https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json")
binding.pry

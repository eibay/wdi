require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

parsed_wifi = JSON.parse(File.read('https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json'))
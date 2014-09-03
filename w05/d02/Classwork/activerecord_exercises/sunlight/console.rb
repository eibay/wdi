require 'pry'
require 'httparty'
require_relative './models/senator.rb'
require_relative './models/bills.rb'
require_relative './db/connection.rb'

bills = HTTParty.get('https://congress.api.sunlightfoundation.com/legislators?chamber=senate?apikey=5e33954a5dc741e4a538472eee2df7f7')['results']

binding.pry
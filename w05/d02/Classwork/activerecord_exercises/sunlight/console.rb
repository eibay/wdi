require 'pry'

require_relative './models/senator.rb'
require_relative './models/bill.rb'
require_relative './db/connection.rb'

binding.pry

# senator_info = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&per_page=all&apikey=c512ee4ec11346cf8880a9d96ccff855")
# File.write('senators_formatted.json', senator_info )


require 'pry'
require 'HTTParty'



response = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?sponsor_id=B001265&per_page=10&apikey=c5fc05f9a80541f296b9e79ec240f292")
binding.pry
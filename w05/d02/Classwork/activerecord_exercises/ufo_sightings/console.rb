require 'pry'
require 'json'

# ufos = []

# ufo = {
# 	sighted_at: "20100603"
# 	reported_at: "20100706"
# 	location: " Bluffton, IN"
# 	shape: " circle"
# 	duration: "15 min."
# 	description: "blah blah"
# }

ufos = JSON.parse(File.read('./ufo_formatted.json'))

binding.pry


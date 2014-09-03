require 'httparty'
require 'erb'

rando = HTTParty.get("http://api.randomuser.me/")
	rando = rando["results"][0]["user"]
	randofirst = rando["name"]["first"]
	randolast = rando["name"]["last"]
	randofull = randofirst + " " + randolast
	hash = {
		"full_name" => randofull,
		"city" => rando["location"]["city"],
		"state" => rando["location"]["state"]
	}

template = 'This awesome person is named <%= hash["full_name"] %>.
They live in <%= hash["city"] %>, <%= hash["state"] %>.'
renderer = ERB.new(template)
puts output = renderer.result()
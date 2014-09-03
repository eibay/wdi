require 'httparty'

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
puts hash
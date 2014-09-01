require "httparty"
require "erb"

def capped(str)
	split = str.split(" ")
	split = split.collect{|word| word.capitalize}
	split.join(" ")
end



response = HTTParty.get("http://api.randomuser.me")

user = response["results"][0]["user"]



user = {
	full_name: "#{user["name"]["first"].capitalize} #{user["name"]["last"].capitalize}",
	city: capped(user["location"]["city"]),
	state: capped(user["location"]["state"])
}

phrase = "This awesome person is named <%= user[:full_name] %>.\nThey live in <%= user[:city] %>, <%= user[:state] %>."

renderer = ERB.new(phrase)

puts renderer.result


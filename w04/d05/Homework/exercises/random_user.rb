require 'httparty'
require 'pry'

def person
	rand_user = HTTParty.get("http://api.randomuser.me")
	first = rand_user['results'][0]['user']['name']['first'] 
	last = rand_user['results'][0]['user']['name']['last'] 
	full_name = "#{first} #{last}"
	city = rand_user['results'][0]['user']['location']['city'] 
	state = rand_user['results'][0]['user']['location']['state']   
	return person = { 
		full_name: full_name,
		city: city,
		state: state
	}
end

puts person()

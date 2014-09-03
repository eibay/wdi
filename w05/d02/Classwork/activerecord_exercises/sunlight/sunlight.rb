require 'httparty'

@api_key = "a8b5dfc04c9b4ce79ba1f10c9f718658"
@api_url = "https://congress.api.sunlightfoundation.com/"


# senator methods # 

def all_senators  
	method = "legislators"
	url = @api_url + method + "?apikey=" + @api_key
	response = HTTParty.get url 
	response["results"]
end 

def find_senators_by_term_end term_end 
	all_senators.select do |senator|
		senator["term_end"] == term_end
	end 
end 


# bill methods # 

def all_bills 
	method = "bills"
	url = @api_url + method + "?apikey=" + @api_key
	response = HTTParty.get url 
	response["results"]
end 

def find_bills_by_sponsor_id sponsor_id 
	method = "bills" 
	url = @api_url + method + "?sponsor_id=" + sponsor_id + "&apikey=" + @api_key
	response = HTTParty.get url 
	response["results"]
end 

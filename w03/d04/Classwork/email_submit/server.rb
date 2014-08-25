require 'sinatra'
require 'pry'

info_array = []

get("/") do 
	erb(:main)
end

post("/info_page") do 

	info_hash = {}
	email_address = params["email"]
	first_name = params["name_first"]
	last_name = params["name_last"]
	phone_number = params["number"]

	info_hash[:email] = email_address
	info_hash[:first_name] = first_name
	info_hash[:last_name] = last_name
	info_hash[:phone_number] = phone_number

	info_array.push(info_hash) 

	# File.open('./views/email_log.erb', 'a')
	# puts "#{info_array}"
	erb(:email_page, {locals: { info_array: info_array }})
end

require 'sinatra'

get("/") do
	emails = [] 
	saved = File.read("emails.txt")
	saved = saved.split(",")
	saved.each {|email| emails.push(email)}
	erb(:index, {locals: { emails: emails } })
end

get("/emails") do
	erb(:emails)
end
	
post("/emails") do
	email = params["email"]
	first = params["first"]
	last = params["last"]
	File.open("emails.txt", 'a') {|file| file.write("#{first} #{last}:#{email},") }
	redirect ("/")
end


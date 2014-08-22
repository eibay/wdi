require 'sinatra'
require 'pry'
require 'io/console'
list = IO.binread("list.txt")
get "/" do
erb(:index)
end

post "/list" do 
	firstname = params["first name"]
	lastname = params["last name"]
	ssn = params["ssn"]

	list += "<li>" + ssn + "<ul><li>" + firstname + " " + lastname + "</li></ul>" + "</li>"
	IO.binwrite("list.txt", list)
	erb(:results, locals: { mailinglist: list })
end
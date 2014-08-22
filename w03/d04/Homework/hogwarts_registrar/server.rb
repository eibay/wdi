require 'sinatra'
require 'pry'
require "sinatra/reloader" if development?

#Sessions is a simple way to carry around all the student data as long as we don't close our browser window.
#http://www.sinatrarb.com/configuration.html
enable :sessions

#I was getting an error where only an empty array was showing on the page. This method will make sure that when we go
#to do something, the array exists, and if it does not it will create it.
before do
	session[:data] ||= []
end

get ('/students/new') do
	erb(:register)
end

get("/students") do
	@students = session[:data]
	erb(:students)
end

post("/students") do
  # Grab the data from the form
  first_name = params["first"]
  last_name = params["last"]
  age = params["age"]
  favorite_spell = params["spell"]


  student = { first: first_name, last: last_name, age: age, spell: favorite_spell,
  				id: session[:data].size + 1 }

  # Need to add the hash to the array
  session[:data].push(student)

  # Need to redirect to the show page for the newly registered student
  redirect to("/students/show/#{student[:id]}")

end

get("/students/show/:id") do
	@student = session[:data][params[:id].to_i - 1]
	erb(:student)
end

get("/search") do
	erb(:search)
end

post("/search") do
	query = params[:name]
	students = session[:data]

#User provides a search query to iterate through array of student in our 'database' and find a match.
	match = false
	

	students.each do |student|
		full_name = "#{student[:first]} #{student[:last]}"
		#I used downcase so that no matter how a query is entered, it will find the match.
		#I used Regexp to match patterns against my strings. http://www.ruby-doc.org/core-1.9.3/Regexp.html
		if full_name.downcase =~ Regexp.new(query.downcase)
			#If the full name matches match = true
			match  = true
			break
		end
	end

	if match
		@msg = "A student matching \"#{query}\" is registered at Hogwarts."
	else
		@msg = "No students matching \"#{query}\" are registered at Hogwarts."
	end

	erb(:search_result)
end
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get("/") do
	students = JSON.parse(File.read('./students.txt'))

	erb(:index, { locals: { students: students} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  # students is an array
  students = JSON.parse(File.read('./students.txt'))
  # add hash to array
  students.push(person)
  # convert students array to JSON
  students_json = JSON.generate(students)
  # takes 2 args, file to write and what to write
  File.write('./students.txt', students_json)

  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end

# to search for one student 

get("/students/:first_name") do
# :first_name is going to be a key that gives a value of a student's name (so students actual name is going to come up in the browser)
# :first_name has to be a symbol because it is part of a dynamic path
# :first_name HERE has nothing to do with 'first_name' earlier
# this is syntax for sinatra

  
# have to do the file.read in the get... do loop so that it acts on that file and dynamically updates it
# if it's outside of the loop it doesnt get updated (TCP allowed us to because every interaction went through a loop which read the variables outside the loop before acting on the inner loop)
students = JSON.parse(File.read('./students.txt'))

students.find do |student| 

  result = student["first"].downcase == params[:first_name].downcase #this logic will return the ENTIRE hash of the one student who matches the search criteria. so we'll have an entire student record

      #params is a universal variable that pulls the value from a route
      #we'd use this with a form where the user would type in a word with the name first_name

# setting the value inside vs outside the loop:
    # inside the loop that value is only accessible if we are inside the loop
    # outside the loop we can access the value of that iteration outside the loop - this is better because doing things inside the loop can get complex/tricky and also return different things based on what it is looking at at that index point in the array


erb(:student, {locals: {result: result}})
end

#Below: .find is useful wwhen you know that you are searching for one unique variable
# this is because it only returns the FIRST value that is trie;

          # example of using .find

          # arr = [1,2,3,4,5,6,7]
          # arr.find do |num|
          #   num == 4
          # end

          # this returns 4, because that is the first value that is true
          # => 4
  













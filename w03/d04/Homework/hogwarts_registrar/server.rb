require 'sinatra'
require 'pry'

data = []

get ('/') do
	erb(:index)
end

#In Sinatra how do I create an array of hashes of data for each student, then display every student (each do in the index) to display those students, 
#then search those students?

#display students
#post ("/students") do
  #student.push (params{:first_name => first_name, :last_name => last_name, :age => age, :favorite_spell => favorite_spell})
  #erb(:list, { locals: { first_names: first_names, last_names: last_names, age: age, favorite_spell: favorite_spell } })
#end


post("/students") do
  # Grab the data from the form
  first_name = params["first"]
  last_name = params["last"]
  age = params["age"]
  favorite_spell = params["favorite_spell"]


student = { first: first_name, last: last_name, age: age, spell: favorite_spell }

  # add the hash to the array
data.push(student)
  erb(:data, { locals: { students: data } })
end

get("/info") do
  erb(:data, { locals: { students: data } })
end
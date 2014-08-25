require 'json'
require 'sinatra'
require 'sinatra/reloader'
require "pry"

get("/") do

erb(:index)
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email"=> email}
  students = JSON.parse(File.read("./students.txt"))
  students << person
  File.write('./students.txt', students.to_json)
end

get("/students") do
	erb(:students)
end


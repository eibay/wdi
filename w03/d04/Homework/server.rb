require 'sinatra'
require 'pry'
require 'uri'

students = []
index = 0



get "/" do

  erb(:index, {locals: {students: students}})
end

post "/" do

  erb(:index, {locals: {students: students}})
end

get "/students/new" do

  erb(:register)
end

get "/students/:query" do
  erb(:show_student, {locals: {students: students}, query: params[:query]} )
end

post ("/students/show") do
  students << params
  erb(:show_students, {locals: {students: students} })
end

get "/search" do

  erb(:search, {locals: {students: students}, query: params[:query]} )
end

post "/search" do
  students.each do |student|
    if params["search"] == student["first"]
  erb(:search, {locals: {students: students}, query: params[:query]} )
end

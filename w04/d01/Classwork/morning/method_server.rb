require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def index("/")
  students = JSON.parse(File.read('./students.txt'))

end

def students

end

def students(info)

end
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def all()
  return JSON.parse(File.read('./patients.txt'))
end

all

binding.pry
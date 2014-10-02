require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/person'


person = Person.create({
  name: "Joe Blow", 
  age: 44
})
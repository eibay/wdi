require_relative './connection.rb'
require_relative './lib/number.rb'
require 'active_record'
require 'pg'
require 'pry'

binding.pry

n = Number.new()
n[:number] = 5
n.save

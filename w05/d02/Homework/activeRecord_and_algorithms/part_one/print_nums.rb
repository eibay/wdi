require 'active_record'
require 'pry'
require_relative './db/connection'
require_relative './models/single_number'

numbers = Single_number.all()

puts numbers.isPrime
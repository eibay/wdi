require 'active_record'
require_relative './number'
require_relative './connection'
require 'pry'

numbers = Number.all.order(number: :desc)

numbers.each do |num|
	num.isPrime
end
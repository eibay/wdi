require_relative './db/connection.rb'
require 'prime'
require 'pry'

nums = []
allNum = Num.all.order('number DESC')

allNum.each do |element|
	nums<<element["number"]
end
binding.pry
nums.each do |x|
	x.isPrime(x)
end


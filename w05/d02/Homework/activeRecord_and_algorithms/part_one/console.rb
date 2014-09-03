require 'active_record'
require 'pry'
require_relative './db/connection'
require_relative './models/single_number'

num = (1..100)
prime_num = [2, 3, 5, 7]
list = []
num.each do |x|
	unless x%2 == 0 || x%3 == 0 || x%5 == 0 || x%7 == 0 then
		prime_num << x
	end	 
end
require 'active_record'
require_relative './db/connection'
require_relative './models/single_number'

r = Random.new

30.times do |x|
	random_num = Single_number.new(number: r.rand(100))
	random_num.save
end
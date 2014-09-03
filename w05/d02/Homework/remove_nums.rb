require_relative './db/connection.rb'
require 'pry'

if Num.all.length == 0
	puts "ERROR"
else
	Num.delete_all
end
		

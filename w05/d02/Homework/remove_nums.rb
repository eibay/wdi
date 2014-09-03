require_relative "./connection.rb"
require "pry"

class Number < ActiveRecord::Base

end

if Number.count(:num) > 0
	Number.delete_all
else
	puts "Table empty"
end
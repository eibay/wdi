require_relative './connection'
require_relative './number'
require 'pry'


if(Number.all[0] != nil)
	Number.delete_all
else
	puts "There are no numbers to delete"
end

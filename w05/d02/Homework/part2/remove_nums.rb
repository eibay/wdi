require 'active_record'
require_relative './number'
require_relative './connection'

if Number.all.length > 0
	Number.delete_all
else
	puts "Numbers database empty"
end
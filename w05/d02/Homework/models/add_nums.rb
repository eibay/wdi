# generates 30 random numbers and saves them to the database
# numbers do not need to be prime
# this should output an error and quit if there are already numbers in the database
# result: running ruby add_nums.rb should add 30 numbers to the database

require 'active_record'

class Add < ActiveRecord::Base

# random_number = Add.order("RANDOM(30)")
# random_number.id

end
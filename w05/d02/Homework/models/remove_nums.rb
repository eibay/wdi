# automatically removes all numbers from the database
# this should leave your table of numbers completely empty
# be sure there are no errors if the table of numbers is already empty
# result: running ruby remove_nums.rb should remove all persisted numbers

require 'active_record'

class Remove < ActiveRecord::Base

# remove_number= Remove.limit(100).delete_all

end
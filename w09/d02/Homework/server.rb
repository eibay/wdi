# Grocery List App
# a user can add a grocery item to a list 
# a user can remove a grocery item from a list
# A user can mark a grocery item as "bought"
# BONUS - The data should be persistent, in that on a page refresh the data should still be there.

require 'sinatra'
require 'json'
require 'httparty'

get ('/') do 
	erb(:index)
end
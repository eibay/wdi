# require 'sinatra'
# require 'pry'

# hi = "Hello World"

# get("/")do
#   erb(:index, {locals: { greeting: hi } })
# end

require 'sinatra' ; get("/") do ; erb(:index) ; end
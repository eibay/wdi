require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'


get '/' do

all_names = JSON.parse(File.read('./public/ny-baby-names.json'))

# name = all_names["data"][0][9]
# county = all_names["data"][0][10]
# gender = all_names["data"][0][11]
# count = all_names["data"][0][12]
# year = all_names["data"][0][8]
year = all_names["data"][0][8]
# binding.pry


  erb(:index, { locals: { year: year, all_names: all_names } })
end



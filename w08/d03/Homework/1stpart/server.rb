require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'



get '/:year' do
  year = params[:year]
  data = File.read("./public/ny-baby-names.json")
  dataJSON = JSON.parse(data)
  information = dataJSON["data"].find_all do |match|
    match[8] == year
  end
  erb(:index, {locals: {information: information, year:year}})
end
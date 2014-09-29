require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'

get '/:year' do
  erb(:index)
end


get '/information/:year' do
  year = params[:year]
  dataInfo = JSON.parse(File.read("./public/ny-baby-names.json"))
  information = dataInfo["data"].find_all do |match|
    match[8] == year
  end
  return (information.to_json)
end




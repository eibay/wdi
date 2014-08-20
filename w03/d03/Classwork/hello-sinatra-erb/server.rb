require 'sinatra'

set(:probability) { |value| condition { rand <= value } }

get("/") do
  erb(:index)
end


get '/name' , :probability => 0.5 do

	name = params[:first_name]
	insult = params[:insult]
  erb(:name, { locals: { name: name , insult: insult }})
end
get '/name' do
name="Asshole"
 insult = params[:insult]
  erb(:name, { locals: { name: name , insult: insult }})
end

numbers = [3, 23, 7, 57]

get("/fun") do
  erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
end



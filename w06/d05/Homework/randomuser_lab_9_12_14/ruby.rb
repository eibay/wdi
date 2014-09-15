require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'pry'

storage_array = []


get '/' do 
  users = JSON.parse(HTTParty.get("http://127.0.0.1:2000/users"))
  
  5.times do
    storage_array << users[rand(users.length)]
  end

  erb(:index, {locals: {storage_array: storage_array}})
end




post '/user/create' do
  new_user = JSON.parse(HTTParty.get('http://127.0.0.1:2000/user/create'))
  storage_array << new_user

  redirect request.referrer
end




get '/user/:user_id' do
    
  user_info = storage_array.detect { |hash| hash['id'] == params[:user_id] }


  erb(:user_show, {locals: {user_info: user_info}})
end


post '/comment' do



  this_user = storage_array.detect { |hash| hash['id'] == params['this_user_id']}
  this_user['comments'] = [] if this_user['comments'] == nil #create new array as key if it doesnt exist. so i dont overwrite
  new_temp_array = this_user['comments'] #takes the values out and makes new_temp_array. this way we can save old values, since otherwise we'd overwrite.
  new_temp_array << params["comment"] #shovel in the new comment
  this_user['comments'] = new_temp_array #overwrite old value for the key.

  redirect request.referrer
end


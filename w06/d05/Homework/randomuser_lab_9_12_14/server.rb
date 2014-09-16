require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'pry'

request = JSON.parse(HTTParty.get('http://127.0.0.1:2000/users'))

get ('/') do

random_people_array=[]

  i = 0
  while i <= 5
    random_people = request.random
    random_people_array.push(random_people)
    i += 1
  end

  erb(:index, {locals: {random_people_array: random_people_array} })
end

get ('/user/:id') do 
  comments = []a
  id = params['id']
  comment = params['comment']

  comments.each do |x|
    if comments[:id] == id
      comments.push(x)
       end
    end

  erb(:show_user, {locals: {user_information: user_information, comments: comment} })
end

post ('/user/:id') do
  id = params['id']
  comment = params['comment']
  
  comments_all = {id: id, comment: comment}
  comments.push(comments_all)

redirect "/user/#{id}"
end
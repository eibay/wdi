require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'json'

request = JSON.parse(HTTParty.get('http://127.0.0.1:2000/users'))
comments = []

get ('/') do

	people_array=[]

	i = 0
	while i < 6
		person = request.sample
		people_array.push(person)
		i += 1
	end
	erb(:index, {locals: {people: people_array}})
end


get ('/user/:id') do 


	id = params['id'].to_i
	user_comments =[]

	comments.each do |comment|
		if comment[:user_id] == id
			user_comments.push(comment)
		end
	end

	user ={}
		request.each do |person|	
		if person['id'] == id
		user = person
		end
	end

	erb(:user, {locals: {user: user, comments: user_comments}})

end



post ('/user/:id') do

	id = params['id'].to_i
	comment = params['comment']
	
	comment_hash = {user_id: id, comment: comment}
	comments.push(comment_hash)

redirect "/user/#{id}"

end






















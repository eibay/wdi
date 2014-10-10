require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

require_relative './lib/connection.rb'
require_relative './lib/people.rb'

after do
  ActiveRecord::Base.connection.close
end

get ("/") do 
   send_file './views/index.html'
end

# 4th
get ("/people") do
	 list_of_people = People.all()
   list_of_people.to_json
end

# 3rd
post ("/create") do 
	people_hash = {
		name:params["name"],
		age:params["age"],
		id:params["id"]
	}
new_people = People.create(people_hash) #this adds the last item. you can use this or .last()
response = new_people.to_json

end

put ("/people_edit") do
content_type :json
	people_hash = {
		name:params["name"],
		age:params["age"].to_i,
		id:params["id"]
	}
people_edit = People.find_by({id: params[:id].to_i})
people_edit.update(people_hash)
people_hash.to_json
end

# delete ("/delete") do 
# content_type :json
# 	people_hash = {
# 		name:params["name"],
# 		age:params["age"].to_i,
# 		id:params["id"]
# 	}
# people_delete = People.find_by({id: params[:id].to_i})
# people_delete.destroy(people_hash)
# end

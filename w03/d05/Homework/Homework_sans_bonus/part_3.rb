require 'sinatra'
require 'pry'
require 'json'

get '/' do 

	data = File.read("./data.txt")
	data_parsed = JSON.parse(data)
		# binding.pry
	erb(:index, {locals: {patient_data: data_parsed}})
end


##############
### Add    ###
##############

get '/add_patient' do

	erb(:add_patient)
end

post '/add_patient' do
	
	

	名 = params["名"].upcase
	姓 = params["姓"].upcase
	期 = params["期日"] + "-" + params["期月"] + " " + params["期年"]
	病 = params["病"].upcase

	hash_patients = {"first_name" => 名, "last_name" => 姓, "date_admission" => 期, "condition" => 病}


	data = File.read("./data.txt")
	data_parsed = JSON.parse(data)
	data_parsed << hash_patients
	data_to_save = data_parsed.to_json

	File.write('./data.txt', data_to_save)
	erb(:add_patient)
end





##############
### Search ###
##############

get '/search_by_condition' do 
	searched_condition = params["searched_condition"].upcase
	# request.path should equal /search_by_condition/:condition


	data = File.read("./data.txt")
	data_parsed = JSON.parse(data)
	# binding.pry

	erb(:search_condition, {locals: {patient_data: data_parsed, searched_condition: searched_condition}})
end



get '/search_by_name' do
	searched_name = params["searched_name"].upcase

	data = File.read("./data.txt")
	data_parsed = JSON.parse(data)

	erb(:search_name, {locals: {patient_data: data_parsed, searched_name: searched_name}})
end
require 'sinatra'
require 'pry'
require 'json'
require 'httparty'


###############
### Parsing ###
###############

patient_data_random = HTTParty.get("http://api.randomuser.me")
name_random = patient_data_random['results'][0]['user']['name']['first']
sur_random = patient_data_random['results'][0]['user']['name']['last']

data = File.read("./data.txt")
data_parsed = JSON.parse(data)


	###################
	####### GA ########
	###################

	cast_ga = File.read("./cast_ga.txt")

	ary_raw = cast_ga.split("\n")

	ary_split_comma = []
	ary_raw.each do |list|
		split = list.split(",")
		ary_split_comma << split
	end

	array_cast = []

	ary_split_comma.each do |character|
		hash_character = {}
		hash_character[:actor] = character[0] 
		hash_character[:character] = character[1] 
		hash_character[:episodes] = character[2].split(" ")[0].to_i 
		hash_character[:start_year] = character[3].split("-")[0] 
		hash_character[:end_year] = character[3].split("-")[1] 

		hash_character[:end_year] = hash_character[:start_year] if hash_character[:end_year] == nil 
		
		array_cast << hash_character
	end

	doctors = []
	array_cast.each do |character|
		unless character[:character] == nil
			# doctors << character[:character] if character[:character].split(" ")[0] == "Dr."
			doctors << character[:character] if character[:character].include?("Dr.")
		end
	end	


##############
### Main   ###
##############

get '/' do 

		# binding.pry
	erb(:index, {locals: {patient_data: data_parsed}})
end


##############
### Add    ###
##############

get '/add_patient' do

	erb(:add_patient, {locals: {name_random: name_random, sur_random: sur_random}})
end


post '/add_patient' do

	名 = params["名"].upcase
	姓 = params["姓"].upcase
	期 = params["期日"] + "-" + params["期月"] + " " + params["期年"]
	病 = params["病"].upcase
	医生 = doctors[rand(doctors.length)]


	hash_patients = {"first_name" => 名, "last_name" => 姓, "date_admission" => 期, "condition" => 病, "doctor" => 医生}

	data_parsed << hash_patients
	data_to_save = data_parsed.to_json

	File.write('./data.txt', data_to_save)
	erb(:add_patient, {locals: {name_random: name_random, sur_random: sur_random}})
end



##############
### Search ###
##############

get '/search_by_condition' do 
	searched_condition = params["searched_condition"].upcase
	erb(:search_condition, {locals: {patient_data: data_parsed, searched_condition: searched_condition}})
end



get '/search_by_name' do
	searched_name = params["searched_name"].upcase
	erb(:search_name, {locals: {patient_data: data_parsed, searched_name: searched_name}})
end




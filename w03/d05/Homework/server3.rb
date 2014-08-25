require 'json'
require 'sinatra'
require 'pry'

patients=JSON.parse(File.read("public/patients.txt"))


get "/" do 
	erb(:index, {locals: {patients: patients}})
end

get "/addpatient" do
	erb(:addpatient)
end

post "/addpatient" do
	patient={"first" => params[:first], "last" => params[:last], "admission" => params[:admit] , "conditon" => params[:condition]}
	patients=JSON.parse(File.read("public/patients.txt"))

	patients.push(patient)

	File.write("public/patients.txt", patients.to_json)

	redirect "/"
end

get "/search_condition" do
	erb(:search_condition)
end

post"/search_condition" do
	erb(:search_condition_results, {locals:{patients: patients , condition: params[:condition]}})
end

get "/search_first" do
	erb(:search_first)
end

post"/search_first" do
	erb(:search_first_results, {locals:{patients: patients , name: params[:name]}})
end




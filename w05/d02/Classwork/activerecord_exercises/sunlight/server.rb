require_relative './connection'
require_relative './senator'
require_relative './bill'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'


after do
    ActiveRecord::Base.connection.close
end

get ("/") do 
	erb(:index)
end	
get ("/senators") do
	senators=Senator.all
	erb(:senators, {locals:{senators: senators}})
end

get ("/bills") do
	bills=Bill.all
	erb(:bills, {locals:{bills: bills}})
end

get("/senators/:id") do
	id=params[:id]
	senator=Senator.find_by(bioguide_id: id)
	bills=senator.bills
	if(senator.party=="D")
		party="Democratic"
	elsif(senator.party=="R")
		party="Republican"
	end
	erb(:individual_senator,{locals:{senator:senator, bills: bills, party: party}})
end

get("/bills/:title") do
	title=params[:title]
	bill=Bill.find_by('short_title LIKE ?',"%" + title + "%")
	senator=bill.senator
	erb(:individual_bill, {locals:{bill:bill, senator: senator}})
end


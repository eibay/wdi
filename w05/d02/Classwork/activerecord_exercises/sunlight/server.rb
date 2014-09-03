require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require_relative './connection'
require_relative './senator'
require_relative './bill'

after do
	ActiveRecord::Base.connection.close
end

get("/") do
	erb(:index)
end

get("/senators") do
	senators = Senator.all()
	erb(:senators, { locals: { senators: senators } })
end

get("/senators/:bioguide_id") do
	senator = Senator.find_by(bioguide_id: params[:bioguide_id])
	bills = senator.bills
	erb(:senator, { locals: { senator: senator, bills: bills } })
end

get("/bills") do
	bills = Bill.all
	erb(:bills, { locals: { bills: bills } })
end

get("/bills/:title") do
	bill = Bill.find_by("official_title LIKE ?","%" + params[:title] + "%")
	senator = Senator.find_by(bioguide_id: bill.sponsor_id)
	erb(:bill, { locals: { bill: bill, senator: senator} })
end
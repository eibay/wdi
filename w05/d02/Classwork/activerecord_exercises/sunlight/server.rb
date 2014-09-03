require_relative "./senator"
require_relative "./bill"
require_relative "./connection.rb"
require "sinatra"
require "sinatra/reloader"
require "pry"

get "/" do
	erb(:index)
end

get "/senators" do
	erb(:senators, { locals: { senators: Senator.all } })
end

get "/senators/:id" do
	senator = Senator.find_by(id: params["id"])
	bills = senator.bills
	erb(:senator, { locals: { senator: senator, bills: bills } })
end

get "/bills" do
	erb(:bills, { locals: { bills: Bill.all } })
end

get "/bills/:id" do
	bill = Bill.find_by(id: params["id"])
	senator = Senator.find_by(id: bill.senator_id)
	erb(:bill, { locals: { bill: bill, senator: senator } })
end
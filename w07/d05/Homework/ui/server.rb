require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'JSON'
require_relative './db/connection'

get ("/") do
	records = Record.find_by(id: 1)
	erb(:index, locals: {records: records})	
end

wordList = ["hello", "sizes", "butts", "spoon", "drink", "terse", "plant", "beers", "where", "march", "whale", "links", "house", "knife", "forks", "table", "cumin", "salty", "fried", "whine"]

get ("/word") do
	word = wordList.sample
	return word
end

post ("/games") do 
	puts "games hit"
	records = Record.find_by(id: 1)
	games = records["games"] + 1
	records.update(games: games)
end

post ("/win") do 
	puts "win!"
	records = Record.find_by(id: 1)
	wins = records["wins"] + 1
	records.update(wins: wins)
end

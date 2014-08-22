require 'sinatra'
require 'pry'


greys = File.read('./greys.txt')

greys= greys.split("\n")

grey_array=[]



greys.each do |character| 
	
	character_hash = {}
	
	character_hash[:character] = character.split(',')[1]
	character_hash[:actor] = character.split(',')[0]
	character_hash[:episodes] = character.split(',')[2].split(' ')[0]
		if character.split(',')[3].include?('-')
			character_hash[:start_year]= character.split(',')[3].split('-')[0]
			character_hash[:end_year]= character.split(',')[3].split('-')[1]
		else
			character_hash[:start_year]= character.split(',')[3]
		end

	grey_array.push(character_hash)

end


episodes=[]
grey_array.each do |character|

	if character[:episodes].to_i >= 150
		episodes.push(character)
	end
end


minor=[]
grey_array.each do |character|

	if character[:episodes].to_i < 10
		minor.push(character)
	end
end


dr=[]
grey_array.each do |character|

	if character[:character].include?('Dr.')
		dr.push(character)
	end
end



year=[]
grey_array.each do |character|

	if character[:start_year]=="2007" || character[:end_year] == "2007"
		year.push(character)
	elsif 
		character[:start_year].to_i < 2008 && character[:end_year].to_i >= 2007
		year.push(character)
	end
end



get'/' do
	erb(:index)
end

get'/stars' do
	erb(:stars, {locals: {stars: episodes}})
end

get'/minor' do
	erb(:minor, {locals: {minor_character: minor}})
end

get '/dr' do
	erb(:dr, {locals: {doctors: dr}})
end

get'/year' do
	erb(:year, {locals: {year: year } })
end




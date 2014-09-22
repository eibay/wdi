require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get('/') do 
	File.open('index.html')
end

get('/word') do
	content = HTTParty.get('http://hipsterjesus.com/api?paras=1&type=hipster-centric&html=false')
	words = content["text"].split(' ')
	words.delete_if {|word| word.length < 3 || word.length > 6 || word.match(/(\d|[[:punct:]])/)}
	word = words.sample.split('-').join('').upcase.to_json
end
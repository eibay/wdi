require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'pry'
require 'uri'


get '/' do 
content_type :html
File.read('./index.html')

end

get '/style.css' do
content_type :css
File.read('./style.css')

end

get '/game.js' do

content_type :js
File.read('./js/game.js')

end


get '/word' do

	word = HTTParty.get('http://api.wordnik.com:80/v4/words.json/randomWord?hasDictionaryDef=true&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5')['word']
	
	return word
	
end

require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'Httparty'
require 'JSON'

get ("/") do
  erb(:index) 
end


get ("/:something") do

if params[:something] == "values"
  result = File.read("./results.txt")
elsif params[:something]== "word"
  result = HTTParty.get('http://api.wordnik.com/v4/words.json/randomWord?hasDictionaryDef=false&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5')
  result.response.body
  #dont need a body
elsif params[:something] == "results"
   results = params[:result]
  resultsSoFar = JSON.parse(File.read("./results.txt"))
  resultGame = resultsSoFar.push(results)
  File.write('./results.txt',resultGame.to_json)
end

end




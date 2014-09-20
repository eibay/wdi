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
	words.delete_if {|word| word.length < 3 || word.length > 6}
	words.delete_if {|word| word.include?("'")}

	words.each do |word| 
		if word[-1] == '.'
			word = word.chomp('.')
		elsif word[-1] == ','
			word = word.chomp(',')
		end
		word.downcase!
		word = word.split('-').join('')
	end

	word =  words.sample.split('-').join('').to_json
end
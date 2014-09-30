require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do

File.read('./index.html')

end

get '/javascripts/jquery.js' do

content_type :js
File.read('./javascripts/jquery.js')

end

get '/javascripts/underscore.js' do

content_type :js
File.read('./javascripts/underscore.js')

end

get '/javascripts/backbone.js' do

content_type :js
File.read('./javascripts/backbone.js')

end


get '/javascripts/app.js' do

content_type :js
File.read('./javascripts/app.js')

end

get '/books/:title' do
	
	content_type :json

	title = params["title"]	
	book = HTTParty.get("https://www.goodreads.com/book/title.xml?title="+title+"&key=TyJpn76kAdFlAAmsslhbwg")
	
	hash = {title: book["GoodreadsResponse"]["book"]["title"], rating: book["GoodreadsResponse"]["book"]["average_rating"]}

	return hash.to_json

end

post '/books/:title' do

	content_type :json

	title = params["title"]	
	book = HTTParty.get("https://www.goodreads.com/book/title.xml?title="+title+"&key=TyJpn76kAdFlAAmsslhbwg")
	
	hash = {title: book["GoodreadsResponse"]["book"]["title"], rating: book["GoodreadsResponse"]["book"]["average_rating"]}

	booksArray = JSON.parse(File.read('./books.txt'))
	booksArray.push(hash)
	
	File.write('./books.txt', booksArray.to_json)

	return File.read('./books.txt')
	
end












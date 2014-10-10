require "uri"
require "sinatra"
require "Nokogiri"
require "sinatra/reloader"
require "json"
require "pry"
require "httparty"

books = ["Catch-22", "The Fixer", "Neuromancer", "Absurdistan"]

get "/book/:name" do
	resp = HTTParty.get("https://www.goodreads.com/book/title.xml?key=ljFH3psJosDLf8SRiABjZQ&title=" + params["name"])
	parsed_resp = Nokogiri::XML.parse(resp.body)
	rating = parsed_resp.at("GoodreadsResponse average_rating").text
	output = {rating: rating}.to_json
	[200, {"access-control-allow-origin" => "*"}, output]
end

get "/books" do
	[200, {"access-control-allow-origin" => "*"}, books.to_json]
end

post "/books/:book" do
	books.delete(params["book"])
	[200, {"access-control-allow-origin" => "*"}, books.to_json]
end

post "/book/:book" do
	books << params["book"].gsub("+", " ")
	[200, {"access-control-allow-origin" => "*"}, books.to_json]
end


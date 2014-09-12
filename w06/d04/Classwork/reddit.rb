require 'nokogiri'
require 'open-uri'
require 'sinatra'
require 'json'
require 'sinatra/reloader'
require 'pry'

doc=Nokogiri::HTML(open("https://reddit.com"))

json_return=[]
get("/") do 
	content_type :json
doc.css("div.thing").each do |post|
		if(post.at_css("a.title.may-blank") != nil)&&(post.at_css("span.rank").content != "")
	 	upvotes=post.at_css("div.score.unvoted").content 
	  title=post.at_css("a.title.may-blank").content 
	 	url=post.at_css("a.title.may-blank")["href"] 
	 	json_return.push({title:title, url: url, upvotes:upvotes})
	 end
end
json_return.to_json
end



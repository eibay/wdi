require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'

get "/reddit" do 

	# get reddit_page # 
	temp_file = open "https://www.reddit.com/" 
	reddit_page = Nokogiri::HTML temp_file 


	# get titles from reddit_page #
	anchor_titles = reddit_page.css "a.title" 
	anchor_titles_children = anchor_titles.map &:children 
	titles = anchor_titles_children.map &:text


	# get links # 
	links = anchor_titles.map { |anchor_title| anchor_title.attr("href") } 


	# get upvotes # 
	upvote_divs = reddit_page.css "div.score.likes"
	upvote_divs_children = upvote_divs.map &:children 
	upvotes = upvote_divs_children.map &:text 
	 
	a = []
	i = 0 
	while i < titles.length do
		h = { 
			  "title" => titles[i], 
			   "link" => links[i], 
			"upvotes" => upvotes[i] 
		}
		a << h 
		i += 1  
	end 

	a.to_json 
end 
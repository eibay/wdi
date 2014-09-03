require_relative './post'
require_relative './author'
require_relative './image'
require 'json'
require 'httparty'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get ("/") do 


erb(:index)

	
end
	
get("/authors/new") do
	erb(:new_author)
end

post ("/authors") do
	name=params[:name]
	email=params[:email]
	author={"name"=>name , "email"=>email}
	Author.create(author)
	erb(:authors,{locals: {authors: Author.all()}})
end
get ("/authors") do
	erb(:authors,{locals: {authors: Author.all()}})
end
get("/posts/new") do
	erb(:new_post, {locals: {authors: Author.all()}})
end
post ("/posts") do
	keyword=params[:keyword]
	contents=params[:contents]
	author_id=params[:author_id]
	time=Time.new
	created_at=time.strftime("Created on %m/%d/%Y at %I:%M%p")
	post={"keyword"=>keyword, "contents"=>contents, "author_id"=>author_id, "created_at"=>created_at}
	Post.create(post)
	erb(:posts ,{locals: {posts: Post.all()}})
end

get("/posts") do
erb(:posts ,{locals: {posts: Post.all()}})
end

get("/authors/:id") do
	author=Author.find_by("id", params[:id])
	posts=author.post
	erb(:author, {locals:{author: author, posts:posts}})
end
get("/posts/:id") do

	post=Post.find_by("id", params[:id])
	images=post.images
	author=post.author
	binding.pry
	erb(:post, {locals:{author: author, post:post, images: images}})

end
post("/posts/:id/images") do
	post=Post.find_by("id", params[:id])
	tag=post.attributes["keyword"].split(" ").join
	instagram=HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061&count=3")
	images={}
		instagram["data"].each_with_index do |image, index|
			images["#{index}"]=image["images"]["low_resolution"]["url"]
		end
	images["post_id"]=params[:id]
	Image.create(images)
	redirect "/posts/#{params[:id]}"
end












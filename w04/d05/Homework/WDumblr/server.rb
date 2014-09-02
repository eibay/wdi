require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './lib/author'
require_relative './lib/post'
require_relative './lib/image'



get ("/") do
	erb(:index)
end

#Authors~~~~~~~~~~

get("/authors") do 
	erb(:authors, { locals: { authors: Author.all() } })
end


get("/authors/new") do
	erb(:author_new)
end

post("/authors/new") do
	author_hash = {
		name: params["name"], 
		email: params["email"]
	}
	Author.create(author_hash)
	erb(:authors, {locals: {authors: Author.all() } })
end

get("/authors/:id") do 
	author = Author.find_by("id", params["id"])
	posts = author.post
	erb(:author, { locals: { author: author, posts: posts } })
end

#Posts~~~~~~~~~~

get("/posts") do
	erb(:posts, { locals: { posts: Post.all() } })
end

get("/posts/new") do 
	erb(:post_new, { locals: { authors: Author.all() } })
end

post("/posts/new") do
	post_hash= {
		content: params["content"],
		created_at: params["created_at"],
		keyword: params["keyword"],
		author_id: params["author_id"]
	}
	Post.create(post_hash)
	erb(:posts, {locals: { posts: Post.all() }})
end

get("/posts/:id") do
	post = Post.find_by("id", params["id"])
	images = post.image
	erb(:post , {locals: { post: post, images: images } })
end

#Images~~~~~~~~~

post("/posts/:id/images") do
	tag = Post.find_by("id", params["id"])["keyword"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
	
	images = []
	response["data"].each do |x|
		image = x["images"]["standard_resolution"]["url"]
		images << image
	end
	erb(:posts, {locals: {post: post, author: author, images: images } })
end

#created an image_array hash

# Image.create()

#USE INSTANCE VARIABLES, 



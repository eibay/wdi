require_relative "./lib/author"
require_relative "./lib/post"
require_relative "./lib/image"
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

get("/") do 
	erb(:index)
end

get("/authors") do
	authors = Author.all()
	erb(:authors, { locals: { authors: authors } })
end

get("/authors/new") do
	erb(:author_new)
end

post("/authors/new") do
	author = {name: params["name"], email: params["email"]}
	Author.create(author)
	redirect("/authors")
end

get("/authors/:id") do
	author = Author.find_by("id", params["id"])
	posts = author.post
	erb(:author, { locals: { author: author, posts: posts } })
end

get("/posts") do
	posts = Post.all()
	erb(:posts, { locals: { posts: posts } })
end

get("/posts/new") do 
	authors = Author.all()
	erb(:posts_new, { locals: { authors: authors } }) 
end

post("/posts/new") do
	post = {
		content: params["content"], 
		created_at: params["created_at"], 
		keyword: params["keyword"], 
		author_id: params["author_id"]
	}
	Post.create(post)
	redirect("/posts")
end

get("/posts/:id") do
	post = Post.find_by("id", params["id"])	
	images = post.image
	erb(:post, { locals: { post: post, images: images } })
end

post("/posts/:id/images") do	
	post = Post.find_by("id", params["post_id"])
	post_key = post["keyword"].split(" ").join("")
	instagram = HTTParty.get("https://api.instagram.com/v1/tags/#{post_key}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2&count=3")
	images = []
	instagram["data"].each do |instagram|
		image = instagram["images"]["low_resolution"]["url"]
		images << image
	end
	images.each do |image|
		image_hash = {}
		image_hash["url"] = image 
		image_hash["post_id"] = params["post_id"]
		Image.create(image_hash)
	end	
	redirect("/posts/#{post["id"]}")
end
require_relative './lib/connection'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './lib/post'
require_relative './lib/author'
require_relative './lib/image'

get "/" do 
	erb(:main)
end

get "/authors" do 
	erb(:authors, {locals: { authors: Author.all()}})
end

get "/authors/new" do 
	erb(:author_add)
end

post "/authors" do 
	new_author = {name: params["name"], email: params["email"], password: params["password"]}
	Author.create(new_author)
	erb(:authors, {locals: { authors: Author.all}})
end

get "/authors/:id" do 
	author = Author.find_by(id: params["id"])
	posts = author.posts
	erb(:author_page, {locals: { author: author, posts: posts}})
end

# POSTS

get "/posts" do 
	erb(:posts, {locals: { posts: Post.all}})
end

get "/posts/new" do
	erb(:post_add, {locals: { authors: Author.all}})
end

post "/posts" do 
	new_post = {
		content: params["content"], 
		created_at: params["created_at"],
		keyword: params["keyword"],
		author_id: params["author_id"],
	}
	password = Author.find_by(id: params["author_id"])["password"]

	if params["password"] == password
		Post.create(new_post)
		erb(:posts, {locals: { posts: Post.all}})
	else
		"<h1>Sorry, wrong password.  Check yo self.</h1>"
		erb(:post_add, {locals: { authors: Author.all}})
	end
end

get "/posts/:id" do 
	post = Post.find_by(id: params["id"])
	author = post.author
	images = post.images

	erb(:post_page, {locals: {post: post, author: author, images: images}})
end

post "/posts/:id/images" do

	tag =  Post.find_by(id: params["id"])["keyword"]
	api = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

	image1 = {
		url: api["data"][0]["images"]["low_resolution"]["url"],
		post_id: params["id"]
	}
	image2 = {
		url: api["data"][1]["images"]["low_resolution"]["url"],
		post_id: params["id"]
	}
	image3 = {
		url: api["data"][2]["images"]["low_resolution"]["url"],
		post_id: params["id"]
	}

	Image.create(image1)
	Image.create(image2)
	Image.create(image3)

	post = Post.find_by(id: params["id"])
	images = post.images
	author = post.author

	erb(:image_page, {locals: {post: post, images: images, author: author}})
end










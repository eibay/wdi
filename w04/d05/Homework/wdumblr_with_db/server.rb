require "sinatra"
require "sinatra/reloader"
require "pry"
require "httparty"
require_relative "./lib/model.rb"
require_relative "./lib/author.rb"
require_relative "./lib/post.rb"
require_relative "./lib/image.rb"
require_relative './connection'

  after do
    ActiveRecord::Base.connection.close
  end



get("/") do 
	erb(:index)
end

get("/posts") do
	posts = Post.all
	erb(:posts, {locals: {posts: posts}})
end

post("/posts") do
	post = Post.create(
	content: params["content"],
	keyword: params["keyword"],
	author_id: params["author_id"]
	)
	posts = Post.all
	erb(:posts, {locals: {posts: posts}})
end

get("/posts/new") do
	authors = Author.all
	erb(:new_post, {locals: {authors: authors}})
end

get("/posts/:id") do
	post = Post.find_by(id: params[:id])
	author = Author.find_by(id: post[:author_id])
	images = Image.where(post_id: post[:id])
	
	erb(:post, {locals: {post: post, author: author, images: images}})
end

get("/posts/:id/images") do
	post = Post.find_by(id: params[:id])
	erb(:add_images, {locals: {post: post}})
end

post("/posts/:id") do 
	post = Post.find_by(id: params[:id])
	author = Author.find_by(id: post[:author_id])
	keyword = params["keyword"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=1329647cd257431baaf97163e4ef2059")
	
		n = 0
		while n < 3
		Image.create(
		url:response["data"][n]["images"]["standard_resolution"]["url"],
		post_id: params[:id])
		n += 1
		end

	images = Image.where(post_id: post[:id])
	erb(:post, {locals: {post: post, author: author, images: images}})
end



get("/authors") do 
	authors = Author.all
	erb(:authors, {locals: {authors: authors}})
end

post("/authors") do
	Author.create(
	name: params["name"],
	email: params["email"]
	)
	authors = Author.all
	erb(:authors, {locals: {authors: authors}})
end

get("/authors/:id") do
	author = Author.find_by(id: params[:id])
	posts = Post.where(author_id: params[:id])
	erb(:author, {locals: {author: author, posts: posts}})
end

get("/authors/new") do
	erb(:new_author)
end














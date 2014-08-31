require_relative "./connection.rb"
require_relative "./lib/author"
require_relative "./lib/post"
require_relative "./lib/image"
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

require_relative './connection'

after do
	ActiveRecord::Base.connection.close
end

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
	author = Author.find_by(id: params["id"])
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
	post = Post.find_by(id: params["id"])	
	images = post.image
	erb(:post, { locals: { post: post, images: images } })
end

post("/posts/:id/images") do	
	post_id = params["post_id"]
	Image.where(post_id: post_id).delete_all 
	Image.post(post_id)
	redirect("/posts/#{post_id}")
end

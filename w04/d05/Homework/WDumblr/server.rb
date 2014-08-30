require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'json'
require_relative './lib/author'
require_relative './lib/post'



get("/") do
	erb(:index)
end

get("/posts") do
	erb(:posts, { locals: { posts: Post.all() } })
end

get("/posts/new") do
	erb(:new_post, { locals: { authors: Author.all() } })
end

post("/posts") do
	post_hash = {
		title: params["title"],
		keyword: params["keyword"],
		created_at: params["created_at"],
		content: params["content"],
		author_id: params["author_id"]
	}

	Post.create(post_hash)

	erb(:posts, { locals: { posts: Post.all() } })
end

post("/authors") do
	author_hash = {
		name: params["name"],
		email: params["email"]
	}

	Author.create(author_hash)

	erb(:authors, { locals: { authors: Author.all() } })
end


get("/authors") do
	erb(:authors, { locals: { authors: Author.all() } })
end

get("/authors/new") do
	erb(:new_author, { locals: { posts: Post.all() } })
end

get("/posts/:id") do
	post = Post.find_by("id", params[:id])
	images = post.images
	post_author = post.author
	erb(:post, { locals: { post: post, post_author: post_author, images: images } })
end

get("/authors/:id") do
	author = Author.find_by("id", params[:id])
	erb(:author, { locals: { author: author } })
end
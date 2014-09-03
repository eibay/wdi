require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'
require_relative './lib/author'
require_relative './lib/post'


get("/") do
#links to /authors and /posts
	erb(:index)
end

get("/posts") do
#/posts -> all the posts with links to 
#their /posts/:id page and a link to create a new post.
	erb(:posts, { locals: { posts: Post.all() } })
end

get("/posts/new") do
#/posts/new -> a form to create a new post.
	erb(:new_post, { locals: { authors: Author.all() } })
end

post("/posts") do
	post_hash = {
		keyword: params["keyword"],
		created_at: params["created_at"],
		content: params["content"],
		author_id: params["author_id"]
	}

	Post.create(post_hash)

	erb(:posts, { locals: { posts: Post.all() } })
end

get("/posts/:id") do
#/posts/:id -> the post (with a byline, ie who authored the post)
	post = Post.find_by("id", params[:id])
	post_author = post.author
	erb(:post, { locals: { post: post, post_author: post_author } })
end

get("/authors") do
#/authors -> shows all the authors (with links to their
#/authors/:id page) and a link to /authors/
	erb(:authors, { locals: { authors: Author.all() } })
end

post("/authors") do
#/authors/new -> a form to create a new author
	author_hash = {
		name: params["name"],
		email: params["email"]
	}

	Author.create(author_hash)

	erb(:authors, { locals: { authors: Author.all() } })
end

get("/authors/new") do
	erb(:new_author, { locals: { posts: Post.all() } })
end

get("/authors/:id") do
	author = Author.find_by("id", params[:id])
	erb(:author, { locals: { author: author } })
end


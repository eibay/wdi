require_relative './author'
require_relative './post'
require 'pry'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'time'
require 'httparty'

get("/") do 
	erb(:index)
end

get("/authors") do
	authors = Author.all()
	erb(:authors, {locals: {authors: authors} } )
end

get("/authors/new") do
	posts = Post.all()
	erb(:new_author, {locals: {posts: posts } } )
end

post("/authors") do
	author_hash = {
		name: params["name"],
		email: params["email"],
		post_id: params["post_id"]
	}
	Author.create(author_hash)

	erb(:authors, {locals: { authors: Author.all() } } )
end

get("/author/:id") do
	author = Author.find_by("id", params[:id])
	erb(:author, {locals: {author: author } } )
end

get ("/posts") do
	erb(:posts, {locals: {posts: Post.all() } } )
end

get("/posts/new") do
	authors = Author.all()
	posts = Post.all
	erb(:new_post, {locals: { authors: authors, posts: posts } } )
end 

post("/posts") do
	post_hash = {
		content: params["content"],
		keyword: params["keyword"],
		created_at: params["created_at"],
		author_id: params["author_id"]
	}

	Post.create(post_hash)

	erb(:posts, {locals: {posts: Post.all(), authors: Author.all } })
end

get("/post/:id") do
	post = Post.find_by("id", params[:id])

	# images_array = [] 
	# images["data"].each do |image|
	# image = image["images"]["low_resolution"]["url"]
	# images_array.push(image)

	image_hash = {
		image_url: params["image_url"],
		post_id: params["post_id"]
	}
	Image.create(image_hash)

	erb(:post, {locals: {post: post, images: Image.all()} } )
end


get("/posts/:id/images") do
	post = Post.find_by("id", params[:id])
	keyword = post["keyword"]
	images = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=f487e0636e6e44c396a32f49390219fe&count=3")
	erb(:images, {locals: {post: post, images: images, keyword: keyword } } )
end

post("/posts/:id/images") do
	post = Post.find_by("id", params[:id])
	keyword = post["keyword"]
	images = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=f487e0636e6e44c396a32f49390219fe&count=3")
	erb(:images, {locals: {posts: Post.all(), keyword: keyword, images: images } })
end


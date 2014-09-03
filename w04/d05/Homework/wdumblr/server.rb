require "sinatra"
require "sinatra/reloader"
require "pry"
require "httparty"
require_relative "./lib/model.rb"
require_relative "./lib/author.rb"
require_relative "./lib/post.rb"
require_relative "./lib/image.rb"


get("/") do 
	erb(:index)
end

get("/posts") do
	posts = Post.all()
	erb(:posts, {locals: {posts: posts}})
end

post("/posts") do
	post = {}
	post["content"] = params["content"]
	post["created_at"] = params["created_at"]
	post["keyword"] = params["keyword"]
	post["author_id"] = params["author_id"]
	Post.create(post)
	posts = Post.all()
	erb(:posts, {locals: {posts: posts}})
end

get("/posts/new") do
	authors = Author.all()
	erb(:new_post, {locals: {authors: authors}})
end

get("/posts/:id") do
	# binding.pry
	post = Post.find_by("id", params[:id])
	author = post.author
	images = post.images
	
	erb(:post, {locals: {post: post, author: author, images: images}})
end

get("/posts/:id/images") do
	post = Post.find_by("id", params[:id])
	erb(:add_images, {locals: {post: post}})
end

post("/posts/:id") do 
	post = Post.find_by("id", params[:id])
	author = post.author
	keyword = params["keyword"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=1329647cd257431baaf97163e4ef2059")
	
		n = 0
		while n < 3
		image = {}
		image["url"] = response["data"][n]["images"]["standard_resolution"]["url"]
		image["post_id"] = params[:id]
		Image.create(image)
		n += 1
		end

	images = post.images
	erb(:post, {locals: {post: post, author: author, images: images}})
end



get("/authors") do 
	authors = Author.all()
	erb(:authors, {locals: {authors: authors}})
end

post("/authors") do
	author ={}
	author["name"] = params["name"]
	author["email"] = params["email"]
	Author.create(author)
	authors = Author.all()
	erb(:authors, {locals: {authors: authors}})
end

get("/authors/:id") do
	author = Author.find_by("id", params[:id])
	posts = author.posts
	erb(:author, {locals: {author: author, posts: posts}})
end

get("/authors/new") do
	erb(:new_author)
end














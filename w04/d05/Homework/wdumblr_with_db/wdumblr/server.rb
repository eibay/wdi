require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'securerandom'
require_relative './lib/author'
require_relative './lib/post'
require_relative './lib/image'

get("/") do 
erb(:index)
end

get("/authors") do 
erb(:authors, locals: {authors: Author.all()})
end

get("/posts") do 
erb(:posts, locals: {posts: Post.all()})
end

get("/authors/new") do 
erb(:authors_new)
end

post("/authors") do 
	
	newAuthor = {
		"name" => params["name"],
		"email" => params["email"],
		"id" => SecureRandom.hex

	}
	Author.create(newAuthor)
erb(:authors, locals: {authors: Author.all()})
end

get ("/posts/new") do
erb(:posts_new, locals: {authors: Author.all()})
end

post ("/posts") do
	time = Time.now
	time = time.strftime("%A, %b %d at %T.")
	newPost = {
		"id" => SecureRandom.hex,
		"content" => params["content"],
		"keyword" => params["keyword"],
		"author_id" => params["author_id"],
		"created_at" => time
	}
	Post.create(newPost)
erb(:posts, locals: {authors: Author.all(), posts: Post.all()})
end

get ("/authors/:id") do
	author = Author.find_by(id: params[:id])
	binding.pry
erb(:author, locals: {author: author, posts: author.posts})
end

get ("/posts/:id") do 
	post = Post.find_by("id", params[:id])
	
	images = post.images
	
	if images.length == 0
		images = "Click the button below to add images"
	else
		images = images[0]["url"]
	end
erb(:post, locals: {post: post, author: post.author, images: images})
end
post ("/images/:keyword") do 
	tag = params[:keyword]
	picArr = ""
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?access_token=1466865270.3d38625.ec687c5964d8437e9c7571e047cacada&count=3")
	response["data"].each do |x|
		picArr+="<li><img src='#{x["images"]["standard_resolution"]["url"]}'></li>"
	end
	
	imagehash = {
		"post_id" => params[:id],
		"url" => picArr
	}
	Image.create(imagehash)
erb(:posts, locals: {authors: Author.all(), posts: Post.all()})
end





# http://www.crawfordforbes.com/insta#access_token=1466865270.3d38625.ec687c5964d8437e9c7571e047cacada


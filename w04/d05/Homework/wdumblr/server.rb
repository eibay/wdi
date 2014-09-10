require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './lib/author'
require_relative './lib/post'
require_relative './lib/image'
require 'pry'

get("/") do 
	erb(:index)
end

get("/authors") do
	erb(:authors, { locals: { authors: Author.all() } })
end

get("/authors/new") do
	erb(:new_author)
end

post("/authors") do
	author_hash = {
		name: params["name"],
		email: params["email"],
	}

	Author.create(author_hash)

	erb(:authors, { locals: { authors: Author.all(), posts: Post.all() } })
end

get("/authors/:id") do
	author = Author.find_by("id", params[:id])
	posts = author.post
	erb(:author, { locals: { author: author, posts: posts } })
end


get("/posts") do
	erb(:posts, { locals: { posts: Post.all() } })
end

get("/posts/new") do
	erb(:new_post, { locals: { authors: Author.all() } })
end

get("/posts/:id") do
	post = Post.find_by("id", params[:id])
	author = post.author
	images = post.images
	keyword = Post.find_by("id", params["id"])["keyword"]

	erb(:post, { locals: { post: post, author: author, images: images, keyword: keyword} })
end

post("/posts/:id/images") do
	
	keyword = Post.find_by("id", params["id"])["keyword"]
	# instagram = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

	# image_1 = {
	# keyword: keyword,
	# post_id: params["id"],
	# image_url: instagram["data"][0]["images"]["standard_resolution"]["url"]
	# }
	# Image.create(image_1)

	# image_2 = {
	# keyword: keyword,
	# post_id: params["id"],
	# image_url: instagram["data"][1]["images"]["standard_resolution"]["url"]
	# }
	# Image.create(image_2)

	# image_3 = {
	# keyword: keyword,
	# post_id: params["id"],
	# image_url: instagram["data"][2]["images"]["standard_resolution"]["url"]
	# }
	# Image.create(image_3)

	tagged_image = 0
	3.times do 
	instagram = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

	image_hash = {
		keyword: keyword,
		post_id: params["id"],
		image_url: instagram["data"][tagged_image]["images"]["standard_resolution"]["url"]
	}

		Image.create(image_hash)

		tagged_image += 1
	end

	post = Post.find_by("id", params[:id])
	title = Post.find_by("id", params[:id])["title"]
	images = post.images
	author = post.author

erb(:images, { locals: { post: post, author: author, keyword: keyword, title: title, images: images } })

end

post("/posts") do
	post_hash = {
		title: params["title"],
		content: params["content"],
		created_at: Time.now.strftime("%F/%T"),
		tag_id: params["keyword"],
		author_id: params["author_id"],
	}

	Post.create(post_hash)

	erb(:posts, { locals: { posts: Post.all() } })
end	
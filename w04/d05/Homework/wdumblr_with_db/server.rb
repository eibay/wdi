require_relative './lib/connection'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './lib/post'
require_relative './lib/author'
require_relative './lib/image'

get('/') do
	erb(:index)	
end

post('/authors') do
	author_hash = {
		name: params["name"],
		email: params["email"]
	}
	Author.create(author_hash)
	
	erb(:authors, {locals: {authors: Author.all()} })
end

get('/authors') do
	erb(:authors, {locals: {authors: Author.all()} })
end

get('/authors/add') do
	erb(:add_author, {locals: {authors: Author.all()} })
end

get('/authors/:id') do 
	author = Author.find_by("id", params["id"])
	post = Post.select_by("author_id", author["id"])
	erb(:author, {locals: {author: author, posts: post} })
end

###########################################################################

post('/posts') do
	post_hash = {
		title: params["title"],
		content: params["content"],
		created_at: params["created_at"],
		keyword: params["keyword"],
		author_id: params["author_id"]
	}
	Post.create(post_hash)
	
	erb(:posts, {locals: {posts: Post.all()} })
end

get('/posts') do
	erb(:posts, {locals: {posts: Post.all()} })
end

get('/posts/add') do
	erb(:add_post, {locals: {authors: Author.all() } })
end

get('/posts/:id') do 
	post = Post.find_by("id", params[:id])
	images = Image.select_by("post_id", post["id"])

	author = Author.find_by("id", post["author_id"])
	erb(:post, {locals: {post: post, author: author, images: Image.all()} })
end

###########################################################################

post('/post/:id/images') do
	post= Post.find_by("id", params[:id])
	tag = Post.find_by("id", params[:id])["keyword"]
# binding.pry

	i = 0
	3.times do
		instagram_api = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=99f63fc7c49d95d87410b06fb8a26637")

		image_hash = {
			tag: post["tag"],
			post_id: post["id"],
			url: instagram_api["data"][i]["images"]["low_resolution"]["url"],
		}
		
		Image.create(image_hash)
		i+= 1
	end

	images = Image.select_by("post_id", post["id"])
	author = Author.find_by("id", post["author_id"])
	erb(:images, {locals: {post: post, author: author, images: Image.all()} })
end

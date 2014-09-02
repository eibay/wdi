require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/author'
require_relative './lib/post'

get("/") do 
	erb(:index)	
end

get("/authors") do
	erb(:authors, { locals: { authors: Author.all(), } })
end

get("/authors/new") do
	erb(:new_author)
end

post("/authors") do
	author_hash = {
		name: params["name"],
		email: params["email"]
	}

	Author.create(author_hash)

	erb(:authors, { locals: { authors: Author.all(), } })
end

get("/authors/:id") do

	author = Author.find_by("id", params[:id]) 	
	erb(:author, { locals: { author: author } } )
end


get("/posts") do
	erb(:posts, { locals: { posts: Post.all(), } })
end

get("/posts/new") do
	erb(:new_post, { locals: { authors: Author.all(), } })
end

post("/posts") do
	post_hash = {
		name: params["name"],
		content: params["content"],
		created_at: params["created_at"],
		keyword: params["keyword"],
		author_id: params["author_id"]
		}

		Post.create(post_hash)

	erb(:posts, { locals: { posts: Post.all(), authors: Author.all(), } } )
end

get("/posts/:id") do

  	post = Post.find_by("id", params[:id]) 

	erb(:post, { locals: { post: post } } )  #pass post[author_id]
end

post("/posts/:id/images") do

	post = Post.find_by("id", params[:id])

	images = "images to come from instatgram"

	# images = Images.find_by("id", params[:id])   #params[:id] is the post id

	erb(:images, { locals: { post: post, images: images } } )
end

require "sinatra"
require "sinatra/reloader"
require "pry"
require "httparty"
require_relative "./author"
require_relative "./post"
require_relative "./image"


get "/" do
	erb(:index)
end

get "/authors" do
	erb(:authors, { locals: {authors: Author.all} })
end

get "/authors/new" do
	erb(:author_new)
end

get "/authors/:id" do
	author = Author.find_by("id", params["id"])
	posts = Post.select_by("author_id", params["id"])
	erb(:author, { locals: {author: author, posts: posts} })
end

get "/posts" do
	erb(:posts, { locals: {posts: Post.all, authors: Author.all} })
end

get "/posts/new" do
	erb(:post_new, { locals: {authors: Author.all} })
end

get "/posts/:id" do
	post = Post.find_by("id", params["id"])
	author = Author.find_by("id", post["author_id"])
	images = Image.select_by("post_id", post["id"])
	erb(:post, { locals: {post: post, author: author, images: images} })
end

post "/authors/new" do
	author = {
		"name" => params["name"],
		"email" => params["email"]
	}
	Author.create(author)
	erb(:authors, { locals: {authors: Author.all} })
end

post "/posts/new" do
	post = {
		"content" => params["content"],
		"created_at" => Time.now.strftime("%l:%M %B %e, %Y"),
		"keyword" => params["keyword"],
		"author_id" => params["author_id"]
	}
	Post.create(post)
	erb(:authors, { locals: {authors: Author.all} })
end

post "/posts/:id/images" do
	post = Post.find_by("id", params["id"])
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{post["keyword"]}/media/recent?client_id=f36cce4cc31d4041bb2a387d7c015939")
	array = []
	response["data"].each{ |hit| array << hit["images"]["standard_resolution"]["url"]}
	3.times do
		image = {
			"url" => array.shuffle!.pop,
			"keyword" => post["keyword"],
			"post_id" => post["id"]
		}
		Image.create(image)
	end
	images = Image.select_by("post_id", post["id"])
	author = Author.find_by("id", post["author_id"])
	erb(:post, { locals: {post: post, author: author, images: images}})
end


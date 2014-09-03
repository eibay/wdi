require 'sinatra'
require 'httparty'
require_relative 'model'
require_relative './lib/author'
require_relative './lib/post'
require_relative './lib/image'
require 'pry'



get('/') do
	erb(:index)
end

get('/authors') do
	authors = Author.all()
	erb(:authors, { locals: { authors: authors }})
end

get('/authors/new') do
	erb(:newauthor)
end

get('/authors/:id') do
	author = Author.find_by("id", params[:id])
	erb(:author, { locals: { author: author }})
end

post('/authors/:id') do
	name = params["name"]
	email = params["email"]
	Author.create({name: "#{name}", email: "#{email}"})
	authors = Author.all()
	erb(:authors, { locals: { authors: authors}})
end

get('/posts') do
	posts = Post.all()
	erb(:posts, { locals: { posts: posts }})
end

get('/posts/new') do
	erb(:newpost)
end

get('/posts/:id') do
	binding.pry
	post = Post.find_by("id", params[:id])
	tag = post["keyword"]
	images = Image.get_three(tag)
	author = post.author["name"]
	erb(:post, { locals: { post: post, author: author, images: images }})
end

post('/posts') do
	title = params["title"]
	content = params["content"]
	created_at = Time.now
	keyword = params["keyword"]
	author_name = params["author_name"]
	author_id = Author.find_by("name", author_name)["id"]
	Post.create({author_id:"#{author_id}", title:"#{title}", content:"#{content}", created_at:"#{created_at}", keyword:"#{keyword}"})
	posts = Post.all()
	erb(:posts, { locals: { posts: posts }})
end

post('/posts/:id/images') do
	post = Post.find_by("id", params[:id])
	tag = post["keyword"]
	three_images = Image.get_three(tag)
	Image.create({tag:tag, url:three_images})
	images = Image.all()
	erb(:tag_image, { locals: { images: images }})
end
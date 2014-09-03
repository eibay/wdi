require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require_relative './author'
require_relative './post'
require_relative './image'


get '/' do

	authors = Author.all

	erb(:index)


end

get '/authors' do

	authors = Author.all
	erb(:authors, {locals: {authors: authors}})

end

post '/authors' do

	name = params['name']
	email= params['email']

	Author.create({name: name, email: email})

	authors = Author.all

	erb(:authors, {locals: {authors: authors}})

end

get '/authors/:id' do	
	
	id = params["id"]
	author= Author.find_by("id", id)
	posts = author.posts

		erb(:author, {locals: {author: author, posts: posts}})
end

get '/posts' do
	posts = Post.all
	authors=Author.all
	erb(:posts, {locals: {authors: authors, posts: posts}})

end

post '/posts' do

	title = params['title']
	content = params['content']
	tag = params['tag']
	author = Author.find_by('id',params['author_id'])
	created_at= Time.now.asctime

	Post.create({
		title: title,
		content: content,
		tag: tag,
		author: author['name'],
		created_at: created_at,
		})

	posts = Post.all
	authors=Author.all

	erb(:posts, {locals: {authors: authors, posts: posts}})

end

get '/posts/:id' do

	id = params['id']
	post = Post.find_by("id", id)
	images = post.images
	erb(:post, {locals: {post: post, images: images}})

end

post '/posts/:id' do 

	tag = params['tag']
	id = params['id']
	post = Post.find_by("id", id)

	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
	
	images = []		
			i = 0
			3.times do
				hash = {}
				hash["url"] = response["data"][i]["images"]["thumbnail"]["url"]
				hash["post_id"] = id
				hash["tag"] = tag
				images.push(hash)
				i +=1
			end

	images.each do |image|
		Image.create(image)
	end

	images = post.images

	erb(:post, {locals: {images: images, post: post}})

end












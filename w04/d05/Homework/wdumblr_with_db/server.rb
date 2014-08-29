require_relative './connection'
require_relative './post'
require_relative './author'
require_relative './image'
require 'json'
require 'httparty'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

 after do
    ActiveRecord::Base.connection.close
 end

get ("/") do 
erb(:index)
end
	
get("/authors/new") do
	erb(:new_author)
end

post ("/authors") do
	Author.create(name: params[:name], email: params[:email], password: params[:password])
	erb(:authors,{locals: {authors: Author.all}})
end

get ("/authors") do
	erb(:authors,{locals: {authors: Author.all}})
end
get ("/authors/") do
	erb(:authors,{locals: {authors: Author.all}})
end

get("/posts/new") do
	erb(:new_post, {locals: {authors: Author.all}})
end

post ("/posts") do
	author=Author.find_by(id: params[:author_id])

	if(params[:password]==author["password"])
		Post.create(content: params[:contents], keyword: params[:keyword], author_id: params[:author_id])
		erb(:posts ,{locals: {posts: Post.all}})
	else
		erb(:incorrect_password, {locals:{author: author}})
	end
end

get("/posts") do
erb(:posts ,{locals: {posts: Post.all}})
end

get("/posts/") do
erb(:posts ,{locals: {posts: Post.all}})
end

get("/authors/:id") do
	author=Author.find_by(id: params[:id])
	
	posts=Post.where(author_id: params[:id])
	erb(:author, {locals:{author: author, posts:posts}})
end

get("/posts/:id") do

	post=Post.find_by(id: params[:id])
	author=Author.find_by(id: post[:author_id])
	images=Image.find_by(post_id: post[:id])
	
	erb(:post, {locals:{author: author, post:post, images: images}})

end

post("/posts/:id/images") do
	post=Post.find_by(id: params[:id])
	tag=post["keyword"].split(" ").join
	instagram=HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061&count=3")
	images=[]
		instagram["data"].each do |image|
			images.push(image["images"]["low_resolution"]["url"])
		end
	
	Image.create(url1: images[0], url2: images[1], url3: images[2], post_id: params[:id])
	redirect "/posts/#{params[:id]}"
end
post("/posts/:id/change_images") do
	image=Image.find_by(post_id: params[:id])
	image.destroy
	image.save
	keyword=params[:keyword]
	tag=keyword.split(" ").join
	instagram=HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061&count=3")
	images=[]
	instagram["data"].each do |image|
		images.push(image["images"]["low_resolution"]["url"])
	end
	
	Image.create(url1: images[0], url2: images[1], url3: images[2], post_id: params[:id])
	redirect "/posts/#{params[:id]}"
end













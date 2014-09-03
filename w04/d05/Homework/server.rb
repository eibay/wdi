require 'pry'
require 'sinatra/reloader'
require 'sinatra'
require 'httparty'
require_relative './author.rb'
require_relative './post.rb'
require_relative './image.rb'

get '/' do
  erb(:index)
end

post '/authors' do
  name = params["name"]
  email = params["email"]
  author = ({"name"=>name, "email"=>email})
  authors = Author.create(author)
  erb(:authors, {locals:{authors: Author.all()}})
end

get '/authors' do
  erb(:authors, {locals:{authors: Author.all()}})
end

get '/authors/new' do
  erb(:newauthor)
end

get '/authors/:id' do
  author = Author.find_by("id", params["id"])
  posts = author.post
  erb(:author,{locals:{author:author, posts: posts}})
end

post '/posts' do
  authorid = params["author"]
  keyword = params["keyword"]
  create = params["create"]
  content = params["content"]
  post = ({"key"=>keyword, "create"=>create, "content"=>content, "author_id"=>authorid})
  posts = Post.create(post)
  
  erb(:posts, {locals:{posts: Post.all()}})
end

get '/posts' do
   erb(:posts, {locals:{posts: Post.all()}})
end




get '/posts/new' do
  erb(:newpost, {locals:{authors: Author.all()}})
end

get '/posts/:id' do
  post = Post.find_by("id", params["id"])
  author = post.author
  images = post.image
  erb(:post, {locals: {author:author, post:post, images:images}})
end

post "/posts/:id/images" do
  post = Post.find_by("id", params["id"])
  keyword = post["key"]
  id = post["id"]
  response = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")
  image1 = response["data"][0]["images"]["standard_resolution"]["url"] 
  image2 = response["data"][1]["images"]["standard_resolution"]["url"]
  image3 = response["data"][2]["images"]["standard_resolution"]["url"]
  images = [image1, image2, image3]
  image = Image.create({"keywork"=>"keyword", "post_id"=>id, "images"=>images})
  erb(:images, {locals: {response: response, keyword:keyword, id:id,image1:image1,image2:image2, image3:image3}})
end

get "/posts/:id/images" do
  erb(:images, {locals: {response: response}})
end

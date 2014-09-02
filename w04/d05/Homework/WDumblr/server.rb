require_relative './lib/model'
require_relative './lib/author'
require_relative './lib/post'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'HTTParty'
require 'json'
require 'uri'

get "/" do

  erb(:index)
end

get "/authors" do
  authors = Author.all()
  erb(:authors, locals: {authors: authors})
end

post "/authors" do
  name = params["name"]
  email = params["email"]
  bio = params["bio"]

  new_author = {name: name, email: email, bio: bio}

  Author.create(new_author)
  authors = Author.all()
  erb(:authors, locals: {authors: authors})
end

get "/authors/new" do
  erb(:new_authors)
end

get "/author/:id" do
  author = Author.find_by("id", params[:id])
  posts = Post.select_by("author_id", params[:id])
  erb(:author, locals: {author: author, posts: posts})
end

get "/posts" do
  posts = Post.all()
  erb(:posts, locals: {posts: posts})
end

post "/posts" do
  authors = Author.all()
  posts = Post.all()
  keyword = params["keyword"]
  content = params["content"]
  author_id = params["author_id"]
  created_at = params["created_at"]

  new_post = {keyword: keyword, content: content, author_id: author_id, created_at: created_at}
  Post.create(new_post)

  erb(:posts, locals:{ authors: authors, posts: posts})
end

get "/posts/new" do
  authors = Author.all()
  erb(:new_posts, locals: {authors: authors})
end

get "/post/:id" do
  post = Post.find_by("id", params["id"])
  author = post.author
  
  erb(:post, locals: {post: post, author: author, imgs: imgs})
end

post "/post/:id/images" do
  query = params["image"].split(" ")[0]


 insta_api = HTTParty.get("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")
 # binding.pry

 imgs = insta_api["data"].each do |img|
   return img["images"]["low_resolution"]["url"]
 end

 erb(:post, locals: {post: post, author: author, imgs: imgs})

end

require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require_relative './lib/author.rb'
require_relative './lib/post.rb'


get '/' do 

  erb(:index)
end

#############################

get '/authors' do

  data_authors = Author.all()
  erb(:authors, {locals: { data_authors: data_authors}})
end



post '/authors/new' do 
  Author.create({"name" => params["name"], "email" => params["email"]})

  data_authors = Author.all()
  erb(:authors, {locals: { data_authors: data_authors}})
end

get '/authors/:bob' do
  # binding.pry
  author_id = params["bob"]


  author = Author.find_by("id", author_id)
  author_posts = Post.select_by("author_id", author_id)
  erb(:authors_profile, {locals: {author_posts: author_posts, author: author}})
end

#############################

get '/posts' do


  data_authors = Author.all()
  data_posts = Post.all()
  erb(:posts, {locals: { data_authors: data_authors, data_posts: data_posts}})
end



post '/posts/new' do

  # remember to link author with post with id

  Post.create({"keyword" => params["keyword"], "created_at" => params["created_at"], "content" => params["content"], "author_id" => params["author_id"]})

  data_authors = Author.all()
  data_posts = Post.all()
  erb(:posts, {locals: { data_authors: data_authors, data_posts: data_posts}})
end

get '/posts/:octopus' do
  post_id = params["octopus"]

  post = Post.find_by("id", post_id)
  post_author = Author.find_by("id", post["author_id"])

  erb(:posts_profile, {locals: { post: post, post_author: post_author}})
end




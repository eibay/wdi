require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/author'
require_relative './lib/post'

get("/") do
  erb(:index)
end

get("/authors") do 
  # local_var or method
  # Class.method    

  erb(:authors, { locals: { authors: Author.all(), } })
end

get("/authors/new") do
  erb(:new_author, { locals: { posts: Post.all(), } })
end

#/authors -> shows all the authors (with links to their /authors/:id page) and a link to /authors/new
post("/authors") do
  author_hash = { 
    name: params["name"]
  }

  Author.create(author_hash)

  # TO DO: 
  # write authors view 

  erb(:authors, { locals: { authors: Author.all() } })
  #where do I put the link to their page?
end

get("/authors/:id") do
  author = Author.find_by("id", params[:id])
  erb(:author, { locals: { author: author } })
end

get("/posts") do
   #all the posts with links to their /posts/:id page and a link to create a new post.
  erb(:posts, { locals: { posts: Post.all() } })
end

get("/posts/new") do
  erb(:new_post, { locals: { authors: Author.all() } })
end

get("/posts/:id") do
  post = Post.find_by("id", params[:id])
  erb(:post, { locals: { post: post } })
end






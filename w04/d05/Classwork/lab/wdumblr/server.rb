require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require_relative './lib/author'
require_relative './lib/post'
require_relative './lib/image'

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
    name: params["name"],
    email: params["email"]
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

post("/posts") do
  post_hash = {
    keyword: params["keyword"],
    content: params["content"],
    author_id: params["author_id"],
    created_at: Time.now
  }

  Post.create(post_hash)
  erb(:posts, { locals: { posts: Post.all() } })
end

get("/posts/:id") do
  post = Post.find_by("id", params[:id])
  erb(:post, { locals: { post: post } })
end

    #images = []

post("/posts/:id/images") do
  #when pressed, it hits the server at POST /posts/:id/images
  #The server will hit the Instagram API and create 3 new images 
  #for the given post using the post's keyword as the search tag for Instagram.
  post = Post.find_by("id", params[:id])
  keyword = post["keyword"].split.join
  instagram_pics = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=17a4630338cd4da38b94cbbecd787fae")
  
  3.times do |i|
    url = instagram_pics["data"][i]["images"]["low_resolution"]["url"]
    Image.create(url: url, post_id: params[:id])
  end

  erb(:post, { locals: { post: post } })
end





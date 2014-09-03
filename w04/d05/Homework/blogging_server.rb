require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './author'
require_relative './post'
require_relative './image'

get("/") do
  erb(:index)
end

get("/posts") do
  erb(:posts, {locals: { posts: Post.all() }})
end

post("/posts") do
  post = {"content" => params["content"], "created_at" => Time.now, "keyword" => params["keyword"], "author_id" => params["author_id"]}

  Post.create(post)

  erb(:posts, { locals: {posts: Post.all() }})
end

get("/posts/new") do
  erb(:new_post, {locals: {authors: Author.all() }})
end

get("/posts/:id") do
  post = Post.find_by("id", params[:id])

  author = post.author
  images = post.images

  erb(:post, {locals: {post: post, author: author, images: images}})
end

get("/posts/:id/images") do
  # The server will hit the Instagram API and create 3 new images for the given post using the post's keyword as the search tag for Instagram.

tag = Post.find_by("id", params["id"])["keyword"]
api_call = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")
#binding.pry

image1 = {
    url: api_call["data"][0]["images"]["low_resolution"]["url"],
    post_id: params["id"]
  }
  image2 = {
    url: api_call["data"][1]["images"]["low_resolution"]["url"],
    post_id: params["id"]
  }
  image3 = {
    url: api_call["data"][2]["images"]["low_resolution"]["url"],
    post_id: params["id"]
  }

  Image.create(image1)
  Image.create(image2)
  Image.create(image3)

  post = Post.find_by("id", params["id"])
  images = post.images
  author = post.author

  erb(:image_page, {locals: {post: post, images: images, author: author}})

end

####################

get("/authors") do
  erb(:authors, {locals: {authors: Author.all() }})
end

post("/authors") do
  author = {name: params["name"], email: params["email"]}

  Author.create(author)

  erb(:authors, {locals: {authors: Author.all() }})
end

get("/authors/new") do
  erb(:new_author, {locals: {authors: Author.all() }})
end

get("/authors/:id") do
  author = Author.find_by("id", params[:id])

  authors_posts = Post.select_by("author_id", author["id"])

  erb(:author, {locals: {author: author, posts: authors_posts}})
end



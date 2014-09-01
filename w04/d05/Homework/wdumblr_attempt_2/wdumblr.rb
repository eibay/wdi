require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'httparty'
require_relative './lib/author.rb'
require_relative './lib/post.rb'
require_relative './lib/image.rb'


get '/' do 
  erb(:index)
end

################### Authors #####################

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
  author_id = params["bob"]
  author = Author.find_by("id", author_id)
  author_posts = Post.select_by("author_id", author_id)
  erb(:authors_profile, {locals: {author_posts: author_posts, author: author}})
end

################### Posts #####################

get '/posts' do
  data_authors = Author.all()
  data_posts = Post.all()
  erb(:posts, {locals: { data_authors: data_authors, data_posts: data_posts}})
end

post '/posts/new' do
  Post.create({"keyword" => params["keyword"], "created_at" => params["created_at"], "content" => params["content"], "author_id" => params["author_id"]})
  data_authors = Author.all()
  data_posts = Post.all()
  erb(:posts, {locals: { data_authors: data_authors, data_posts: data_posts}})
end

get '/posts/:id' do
  

  post_id = params["id"]
  post = Post.find_by("id", post_id)
  post_author = Author.find_by("id", post["author_id"])

  # data_images = Image.all()

  specific_data_images = Image.select_by("post_id", post_id)

  erb(:posts_profile, {locals: { post: post, post_author: post_author, post_id: post_id, specific_data_images: specific_data_images}})
end

################### Images #####################

post '/posts/:id/images' do
# binding.pry

  keyword = params["keyword"]
  post_id = params["id"]
  post = Post.find_by("id", post_id)
  post_author = Author.find_by("id", post["author_id"])

  image_list = Image.all()

  insta_api = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=b3dd0e6a077e45d0b8a026c954d59719")
  image_list << Image.new({"post_id" => post_id, "url" => insta_api["data"][0]["images"]["low_resolution"]["url"], "id" => SecureRandom.hex})
  image_list << Image.new({"post_id" => post_id, "url" => insta_api["data"][1]["images"]["low_resolution"]["url"], "id" => SecureRandom.hex})
  image_list << Image.new({"post_id" => post_id, "url" => insta_api["data"][2]["images"]["low_resolution"]["url"], "id" => SecureRandom.hex})

  File.write("./images.txt", image_list.to_json)

  # data_images1 = Image.all
  # binding.pry




  specific_data_images = Image.select_by("post_id", post_id)
  # binding.pry


  erb(:posts_profile, {locals: { post: post, post_author: post_author, post_id: post_id, specific_data_images: specific_data_images}})
end


get '/posts/:id/images' do

  erb(:images)
end

# <!-- SHOW IMAGES -->
# <!--
#   <h1> images </h1>
#   <%data_images.each do |hash|%>
#     <%hash["urls"].each do |img|%>
#       <img src="<%=img%>"/>
#     <%end%>
#   <%end%>
# -->





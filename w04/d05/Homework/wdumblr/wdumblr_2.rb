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



get '/posts/:id' do

  post_id = params["id"]
  post = Post.find_by("id", post_id)
  post_author = Author.find_by("id", post["author_id"])

  data_images = JSON.parse(File.read("./images.txt"))

 #################### # the_image = data_images.find_by ######


  # binding.pry
  erb(:posts_profile, {locals: { post: post, post_author: post_author, post_id: post_id, data_images: data_images}})
end

# get '/posts/:id/images' do

#   erb(:images)
# end


post '/posts/:id/images' do
  keyword = params["keyword"]
  post_id = params["id"]
  post = Post.find_by("id", post_id)

  post_author = Author.find_by("id", post["author_id"])
# binding.pry


##################################
  





# binding.pry
  def image_get(keyword, image_number)
    image_raw = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=b3dd0e6a077e45d0b8a026c954d59719")
    image_link = image_raw["data"][image_number]["images"]["low_resolution"]["url"]
    return image_link
  end


  img_list = []
  img_list << image_get(keyword, 1)
  img_list << image_get(keyword, 2)
  img_list << image_get(keyword, 3)

# binding.pry # code checkpoint - works till here 

  def image_hash(image_list, post_author)
    img_hash = {"id" => SecureRandom.hex, "author_id" => post_author["id"], "urls" => image_list}
    return img_hash
  end





  img_hash = image_hash(img_list, post_author)

  images = Image.new(img_hash)

  # binding.pry

# binding.pry # code checkpoint - works till here

  data_images = JSON.parse(File.read("./images.txt"))
# binding.pry
  data_images << img_hash
  File.write("./images.txt", data_images.to_json) 
  data_images = JSON.parse(File.read("./images.txt"))
  # binding.pry
  

  #######################################

  post_id = params["id"]
  post = Post.find_by("id", post_id)
  post_author = Author.find_by("id", post["author_id"])

  # binding.pry
  erb(:posts_profile, {locals: { data_images: data_images, post: post, post_author: post_author, post_id: post_id}})
end


# post '/posts/:id/images' do
#   keyword = params["keyword"]
#   post_id = params["id"]
#   post = Post.find_by("id", post_id)
#   # binding.pry
#   post_author = Author.find_by("id", post["author_id"])



  # def image_get(keyword, image_number)
  #   image_raw = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=b3dd0e6a077e45d0b8a026c954d59719")
  #   image_link = image_raw["data"][image_number]["images"]["low_resolution"]["url"]
  #   return image_link
  # end


  # img_list = []
  # img_list << image_get(keyword, 1)
  # img_list << image_get(keyword, 2)
  # img_list << image_get(keyword, 3)


  # def image_hash(img_list)
  #   img_hash = {"id" => SecureRandom.hex, "author_id" => post_author["id"], "urls" => img_list}
  #   return img_hash
  # end

  # img_hash = image_hash(img_list)


  # data_images = JSON.parse(File.read("./images.txt"))
  # data_images << img_hash
  # File.write("./images.txt", image_link.to_json)    
 

#   erb(:posts_profile, {locals: { post: post, post_author: post_author, post_id: post_id, data_images: data_images}})
# end



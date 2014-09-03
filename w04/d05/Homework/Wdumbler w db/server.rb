require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require_relative './connection'
require_relative './libs/Author_class'
require_relative './libs/Post_class'
require_relative './libs/Image_class'


  after do
    ActiveRecord::Base.connection.close
  end


get('/') do #links to /authors and /posts
	erb(:index)
end 

#AUTHOR PAGES
get("/author") do # shows all the authors (with links to their /authors/:id page) and a link to /authors/new
	erb(:authors, {locals: { authors: Author.all() }})
end

get("/author/new") do # form creates a new author: params = "name" and "email"
	erb (:new_author)
end 

post ("/authors") do #create new Author instance using info from form
	name = params["name"]
	email = params["email"]
	info = {"name" => name, "email" => email} 
	Author.create(info) #adds ID
	erb(:authors, {locals: { authors: Author.all }})
end

#POST PAGES
get('/posts') do # shows all posts in order of creation

	erb(:posts, {locals: { posts: Post.all }})
end 

get('/post/new') do #form to create a new post: params = "post", "email", "author", and "keyword"
	erb(:new_post, {locals: { authors: Author.all }})
end

post('/posts') do #formatting params, adding them to txt file
	post = params["post"]
	email = params["email"]
	author_id = params["author_id"]
	keyword = params["keyword"]

# need to figure out how to tak the 3 created images and insert itno the specific hash ONLY AFTER the "get image" button was pushed
	# images = Image.instagram(HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=3afaee9a98b343d580e11c3228a8653d"))
	blog_post = {"content" => post, "keyword" => keyword, "author_id" => author_id}
	Post.create(blog_post)

	erb(:posts, {locals: { posts: Post.all }})
end 

get('/posts/:id') do #displays all posts by author. "Get image" button beneath each 
	post = Post.where("author_id" => params["id"])
	i = []
	erb(:post, {locals: { posts: post, image: Image.all, i: i }})
end 

# --> still need to figure out how to add images to post hash. NEDD TO NAME THE HASH. 
#.push 

post('/posts/:id/images') do # searches Instagram API using "keyword" as seach paramater. returns first 3 images 

	id = params["id"]
	author = Post.find_by(author_id: id)
	keyword = author["keyword"]

	images = Image.instagram(HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=3afaee9a98b343d580e11c3228a8653d"))
	post = Post.find_by(keyword: keyword)
	post_id = post["id"] 

	Image.create(url: images["url"], post_id: post_id)
	
	erb(:image)
	
end 
post '/post/1/images' do
  binding.pry
end





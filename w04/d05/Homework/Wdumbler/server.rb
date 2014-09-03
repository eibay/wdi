require 'pry'
require 'sinatra'
require 'HTTParty'
require_relative './libs/model'
require_relative './libs/Author_class'
require_relative './libs/Post_class'
require_relative './libs/Image_class'


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
	erb(:authors, {locals: { authors: Author.all() }})
end

#POST PAGES
get('/posts') do # shows all posts in order of creation
	erb(:posts, {locals: { posts: Post.all() }})
end 

get('/post/new') do #form to create a new post: params = "post", "email", "author", "keyword", and "created_at" (hidden)
	erb(:new_post, {locals: { authors: Author.all(), time: Time.now }})
end

post('/posts') do #formatting params, adding them to txt file
	post = params["post"]
	email = params["email"]
	author_id = params["author_id"]
	keyword = params["keyword"]
	created_at = params["created_at"]
	images = Image.instagram(HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=3afaee9a98b343d580e11c3228a8653d"))
	blog_post = {"post" => post, "email" => email, "author_id" => author_id, "keyword" => keyword, "created_at" => created_at, "images" => images}
	Post.create(blog_post)
	binding.pry
	erb(:posts, {locals: { posts: Post.all() }})
end 

get('/posts/:id') do #displays all posts by author. "Get image" button beneath each 

	post = Post.select_by("author_id", params["id"])

	erb(:post, {locals: { posts: post, image: Image.all() }})
end 

# post('/posts/:id/images') do # searches Instagram API using "keyword" as seach paramater. returns first 3 images --> still need to figure out how to add images to each post
# 	author = Post.find_by("author_id", params["id"])
# 	keyword = author["keyword"]
# 	post_id = author["id"]

# 	insta_hash = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=3afaee9a98b343d580e11c3228a8653d")

# 	images = Image.instagram(insta_hash)

# 	Image.create(images)
	
# 	erb(:image)
	
# end 





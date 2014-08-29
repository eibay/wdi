require 'sinatra'
require_relative "./lib/author"
require_relative "./lib/post"

## GET METHOD ## 
# landing # 

get '/' do 
	erb :welcome 
end 

# authors # 

get "/authors" do 
	erb :authors, {locals: {authors: Author.all}} 
end 

get "/authors/new" do
	erb :sign_up 
end 

# posts # 

get "/posts" do 
	erb :posts, {locals: {posts: Post.all}}
end 

get "/posts/new" do 
	erb :write_post, {locals: {authors: Author.all}}
end 

## POST METHOD ## 

post "/posts" do 
	post = Post.new params["subject"], params["content"], params["author_id"]
	post.create 

	redirect "/posts"
end 

post "/authors" do 
	author = Author.new params["name"], params["email"]
	author.create 

	redirect "/authors"
end 
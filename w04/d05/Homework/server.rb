require 'sinatra'
require_relative "./lib/author"
require_relative "./lib/post"

## METHOD GET ## 
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

get "/authors/:id" do 
	author = Author.find_by_id params[:id]

	erb :author, {locals: {author: author}} 
end 

# posts # 

get "/posts" do 
	erb :posts, {locals: {posts: Post.all}}
end 

get "/posts/new" do 
	erb :write_post, {locals: {authors: Author.all}}
end 

get "/posts/:id" do 
	post = Post.find_by_id params[:id]

	erb :post, {locals: {post: post}}
end 

## METHOD POST ## 

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
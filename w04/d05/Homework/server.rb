require 'sinatra'
require_relative "./lib/author"
require_relative "./lib/post"
require_relative "./lib/image"

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


	# find associated imgs by foreign key # 
	images = Image.find_all_by "post_id", params[:id]

	# get all authors for img form select # 
	authors = Author.all 


	erb :post, {locals: {post: post, images: images, authors: authors}}
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

post "/images" do 

	# defend against bug where filenames w/ spaces will break view # 
	img_src = params["src"][:filename].delete(' ').downcase

	# write img file to public dir # 
	File.open("./public/posts/" + img_src, 'w') do |img|
		img.write params["src"][:tempfile].read 
	end

	# create img obj & 
	# write it to db #  
	img_obj = Image.new img_src, params["alt"], params["post_id"], params["user_id"]
	img_obj.create 

	redirect "/posts/" + params["post_id"]
end
require_relative './lib/author'
require_relative './lib/post'
require_relative './lib/image'
require 'pry'

# authors = Author.find_by("name", "Author")
# posts = Posts.find_by("name", "Post")

# author attributes name, email, title
# post attributes content, created_at, keyword, author_id

# author1 = Author.find_by("name", "Joe Blow")
# post1 = Post.find_by("keyword", "brunch")

# Post.create({
# 	title: "sdsfasdfadsf"
# => keyword: "italian",
# 	created_at: Time.now.strftime("%F/%T"),
# 	content: "Starting this Saturday Eataly is celebrating its fourth anniversary with a series of dishes at its restaurants made with four ingredients like cacio e pepe, and a seafood crudo. The specials will be available for a week..",
# 	author_id: "1049021a1fd42cbd9bde8e465b395409"
# 	})


# Author.create({
# 	name: "Mezcal Monkey",
# 	email: "mezcal@oaxaca.com"
# 	})

# Image.create({
#  	keyword: "italian",
#  	post_id: "6a0f77403cb26502f2b8e637dd311b5c",
# 	image_url: "http://www.deliverywow.com/order-food-online/images/main-photo-chicago-italian-food-delivery.jpg"
#  	})



binding.pry


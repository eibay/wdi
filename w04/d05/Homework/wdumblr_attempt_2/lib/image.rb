# Add a third model. Each Post can have several images associated with it. Create an Image model. 
# Back in console.rb make sure you can create images that belong to a post and call post.images 
# and image.post.

# New Routes

# /posts/:id/images -> contains a button that says "Add Images"
# when pressed, it hits the server at POST /posts/:id/images
# The server will hit the Instagram API and create 3 new images 
# for the given post using the post's keyword as the search tag for Instagram.
# And, when you look at /posts/:id you should see all of the images associated 
# with that post along with the post content.


require_relative './model.rb'
require "securerandom"

class Image < Model

end 



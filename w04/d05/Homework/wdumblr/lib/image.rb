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



  def image_get(keyword, image_number)
    image_raw = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=b3dd0e6a077e45d0b8a026c954d59719")
    image_link = image_raw["data"][image_number]["images"]["low_resolution"]["url"]
    return image_link
  end


  def image_list()
    img_list = []
    img_list << image_get(keyword, 1)
    img_list << image_get(keyword, 2)
    img_list << image_get(keyword, 3)
    return image_list
  end 


  def image_hash(image_list, post_author)
    img_hash = {"id" => SecureRandom.hex, "author_id" => post_author["id"], "urls" => image_list}
    return img_hash
  end



#   img_hash = image_hash(img_list, post_author)
# # binding.pry # code checkpoint - works till here

#   data_images = JSON.parse(File.read("./images.txt"))
# # binding.pry
#   data_images << img_hash
#   File.write("./images.txt", data_images.to_json) 
#   data_images = JSON.parse(File.read("./images.txt"))
#   # binding.pry
  
end
  #######################################


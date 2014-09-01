require_relative './model.rb'
require "securerandom"

class Post < Model
  # def self.images(keyword)
  #   data_images = JSON.parse(File.read("./images.txt"))
  #   image_list = []
  #   image_raw = HTTParty.get("https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=b3dd0e6a077e45d0b8a026c954d59719")
  #   image_link_1 = image_raw["data"][0]["images"]["low_resolution"]["url"]
  #   image_link_2 = image_raw["data"][1]["images"]["low_resolution"]["url"]
  #   image_link_3 = image_raw["data"][2]["images"]["low_resolution"]["url"]

  #   image_hash_1 = {"url" = image_link_1.to_s}

  #   image_list << image_link_1s
  #   File.write("./images.txt", image_link.to_json)
  # end
end
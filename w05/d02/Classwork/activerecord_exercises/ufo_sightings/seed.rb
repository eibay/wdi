require 'json'
require_relative "./ufo.rb"

      # load json file # 

json_file = File.open "./ufo_formatted.json"
ufo_hash_arr = JSON.load json_file


       # main loop #

ufo_hash_arr.each do |ufo|

  UFO.new(
   sighted_at: ufo["sighted_at"],
  reported_at: ufo["reported_at"],
     location: ufo["location"],
        shape: ufo["shape"],
     duration: ufo["duration"],
  description: ufo["description"]
  ).save

end 


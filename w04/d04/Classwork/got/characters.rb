require_relative "./model"
require 'httparty'
class Characters < Model

	def house
		Houses.find_by("id", @attributes["house_id"])
	end
	def self.random_character(how_many)
	how_many=(1..how_many).to_a
	how_many.each do |n|
	api=HTTParty.get("http://api.randomuser.me/")
	first=api["results"][0]["user"]["name"]["first"].capitalize
	last=api["results"][0]["user"]["name"]["last"].capitalize
	name="#{first} #{last}"
	picture=api["results"][0]["user"]["picture"]
   	house_id=Houses.all.sample.attributes["id"]  

	self.create({"name" => name , "picture" => picture, "house_id"=>house_id})
end
	
end
end

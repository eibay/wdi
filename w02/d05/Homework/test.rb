
class String 
	def get_albums 
		self.gsub! ' ', "%20"
		str = "http://www.musicbrainz.org/ws/2/recording/?query=artist:#{self}+recording:ftg2"
		fuck = HTTParty.get(str, headers: {"User-Agent" => "Httparty"}) 
		fuck = fuck["metadata"]["recording_list"]["recording"]
		fuck.delete_if { |result| result["artist_credit"]["name_credit"]["artist"]["name"] != self }
	end 

	def get_cover 
		HTTParty.get("http://coverartarchive.org/release/#{self}/", headers: {"User-Agent" => "Httparty"}) 
	end 
end 

class Array 
	def get_covers 
		# needs to be a release 
		self.map { |album| album["id"].get_cover }
	end 

end 
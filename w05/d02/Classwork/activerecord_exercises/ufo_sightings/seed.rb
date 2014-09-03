require 'pry'
require 'active_record'
require 'json'

sightings = JSON.parse(File.read('./ufo_formatted.json'))



ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "yoshiemuranaka",
  :database => "ufo"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)


class UFO < ActiveRecord::Base

	def self.circle_shape
		self.where({shape: " circle"})
	end


end

	

binding.pry

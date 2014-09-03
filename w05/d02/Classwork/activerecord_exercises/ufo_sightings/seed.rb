require 'active_record'
require 'pry'
require 'JSON'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "crawford",
	:database => "ufo"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Ufo < ActiveRecord::Base
	def circle
		Ufo.where({ shape: 'circle' })
	end


end

Ufo.delete_all
sightings = JSON.parse(File.read('./ufo_formatted.json'))
sightings.each do |x|
	x = Ufo.create({sighted_at: x["sighted_at"], reported_at: x["reported_at"], location: x["location"], shape: x["shape"], duration: x["duration"], description: x["description"]})
end
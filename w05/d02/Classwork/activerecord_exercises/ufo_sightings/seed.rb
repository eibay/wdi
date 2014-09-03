require 'json'
require './sighting'
require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "eric",
	:database => "ufos"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)

sightings = JSON.parse(File.read("./ufo_formatted.json"))

sightings.each do |sighting|
	record = {
		sighted_at: sighting["sighted_at"],
		reported_at: sighting["reported_at"],
		location: sighting["location"],
		shape: sighting["shape"],
		duration: sighting["duration"],
		description: sighting["description"]
	}
	Sighting.create(record)
end
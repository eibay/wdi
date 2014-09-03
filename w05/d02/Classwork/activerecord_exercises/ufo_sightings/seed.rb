require_relative "./sighting"
require "pry"
require "json"

items = JSON.parse(File.read("./ufo_formatted.json"))

Sighting.delete_all

items.each do |sighting|
	incident = Sighting.new(sighting)
	incident.save
end


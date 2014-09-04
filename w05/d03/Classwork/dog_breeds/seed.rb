require 'pry'
require_relative './lib/connection'
require_relative './lib/breed'

beagle = Breed.create({
	name: "Beagle"
	})

golden_retriever = Breed.create({
	name: "Golden Retriever"
	})

poodle = Breed.create({
	name: "Poodle"
	})
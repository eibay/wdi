require_relative './lib/connection.rb'
require_relative './lib/dog.rb'

Breed.delete_all()

Breed.create({
  name: "Golden Retriever"
  })

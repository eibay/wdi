require 'active_record'
require_relative './app/models/puppies.rb'

Puppies.create(name: "Fido", breed: "Collie", cuteness: 4)
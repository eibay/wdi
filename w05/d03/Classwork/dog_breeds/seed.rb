require 'pry'
require_relative './lib/connection'
require_relative './lib/breed'

dog = Dog.create({
  name: "Affenpinscher"
})

dog = Dog.create({
  name: "Afghan Hound"
})

dog = Dog.create({
  name: ""
})
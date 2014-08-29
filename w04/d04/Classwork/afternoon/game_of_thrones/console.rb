require_relative './house'
require_relative './character'
require 'pry'

house = House.find_by("name", "Lannister")
character = House.find_by("name", "Stark")

binding.pry
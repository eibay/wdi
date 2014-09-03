require_relative './connection'
require 'pry'


class Sighting < ActiveRecord::Base
end

Sighting.where({shape:" circle"})

Sighting.find_by({id: rand(Sighting.count)})["id"]

Sighting.where()

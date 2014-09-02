require_relative './connection'

require 'pry'

class Ufo < ActiveRecord::Base
end

#1

Ufo.where(shape: "circle")

#2

Ufo.find_by(id: rand(Ufo.count)) ["id"]

binding.pry
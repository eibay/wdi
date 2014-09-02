require 'pry'
require_relative "./sighting.rb"


circle = Sighting.where( {shape: " circle"})

rando = Sighting.find_by( {id: rand(Sighting.first.id..Sighting.last.id) } ) 

first = Date.parse("19750101")
last = Date.parse("20060101")

range = Sighting.where(sighted_at: first..last)

august_start = Date.parse("20100801")
august_end = Date.parse("20100901")

august_hits = Sighting.where(sighted_at: august_start..august_end)

order = Sighting.order(:sighted_at).each
list = []
order.each{|sighting| list << sighting}
list = list[0..9]




binding.pry
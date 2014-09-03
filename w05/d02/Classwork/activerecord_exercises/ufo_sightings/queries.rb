######
Ufo.where({ shape: " circle" })
######
ufo = UFO.all.sample
ufo.id
ufo = Ufo.order("RANDOM()")
ufo.id
######
ufo = Ufo.where(:sighted_at => "19750101".."20070101")
######
ufo = Ufo.where(:sighted_at => "20100801".."20100831")
######
ufo = Ufo.limit(10).order(sighted_at: :asc)
######
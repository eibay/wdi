require_relative './faction'
require_relative './character'
require 'pry'

cops = Faction.find_by("name", "Cops")
government = Faction.find_by("name", "Government")
drugdealers = Faction.find_by("name", "Drug Dealers")

# Character.create({
# 	name: "Greggs",
# 	image: "http://ia.media-imdb.com/images/M/MV5BMzE5MDM1MDY2OF5BMl5BanBnXkFtZTcwOTIzNDcwMg@@._V1_SX214_CR0,0,214,317_AL_.jpg",
# 	faction_id: cops["id"]
# })

# Character.create({
# 	name: "Freamon",
# 	image: "http://ia.media-imdb.com/images/M/MV5BMTM2ODgwNDAxNF5BMl5BanBnXkFtZTcwNDc1MzMwNQ@@._V1_SY317_CR10,0,214,317_AL_.jpg",
# 	faction_id: cops["id"]
# })

# Character.create({
# 	name: "Pearlman",
# 	image: "http://ia.media-imdb.com/images/M/MV5BMTcwOTYzODY5OF5BMl5BanBnXkFtZTgwNTYwMzMzMjE@._V1_SY317_CR132,0,214,317_AL_.jpg",
# 	faction_id: cops["id"]
# })

# Character.create({
# 	name: "Omar",
# 	image: "http://ia.media-imdb.com/images/M/MV5BMjAwNTg2NjA1Nl5BMl5BanBnXkFtZTcwMjQ4NzY5Mg@@._V1_SY317_CR6,0,214,317_AL_.jpg",
# 	faction_id: drugdealers["id"]
# })

# Character.create({
# 	name: "Carcetti",
# 	image: "http://ia.media-imdb.com/images/M/MV5BMjMwNzE4MzMxNl5BMl5BanBnXkFtZTgwOTYwMTEyMDE@._V1_SY317_CR12,0,214,317_AL_.jpg",
# 	faction_id: government["id"]
# })





binding.pry
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

actor1 = Actor.create({fname: "Geraldine", lname: "Page", picture_url: "http://ia.media-imdb.com/images/M/MV5BMjA3NDA2ODA2M15BMl5BanBnXkFtZTYwNjY1MTM2._V1_SY317_CR3,0,214,317_AL_.jpg"})
actor2 = Actor.create({fname: "James", lname: "Arness", picture_url: "http://ia.media-imdb.com/images/M/MV5BMTkwNjQ4MzA4Ml5BMl5BanBnXkFtZTcwNTk1Nzg0NQ@@._V1_SY317_CR23,0,214,317_AL_.jpg"})
actor3 = Actor.create({fname: "Paul", lname: "Newman", picture_url: "http://ia.media-imdb.com/images/M/MV5BODUwMDYwNDg3N15BMl5BanBnXkFtZTcwODEzNTgxMw@@._V1_SY317_CR22,0,214,317_AL_.jpg"})

movie1 = Movie.create({title: "Hondo", year: 1953, poster_url: "http://ia.media-imdb.com/images/M/MV5BNDU0MjAwMTA3Nl5BMl5BanBnXkFtZTcwOTUxOTAzMQ@@._V1_SY317_CR24,0,214,317_AL_.jpg"})
movie2 = Movie.create({title: "Sweet Bird of Youth", year: 1962, poster_url: "http://ia.media-imdb.com/images/M/MV5BMTc0NDgyMDA2Nl5BMl5BanBnXkFtZTcwNDQyNzIzMQ@@._V1_SY317_CR22,0,214,317_AL_.jpg"})
movie3 = Movie.create({title: "The Happiest Millionaire", year: 1967, poster_url: "http://ia.media-imdb.com/images/M/MV5BNDYzMDczNTczNl5BMl5BanBnXkFtZTcwMTAwNTUyMQ@@._V1_SY317_CR4,0,214,317_AL_.jpg"})
movie4 = Movie.create({title: "The Thing from Another World", year: 1951, poster_url: "http://ia.media-imdb.com/images/M/MV5BODA5MjE1MTY2Ml5BMl5BanBnXkFtZTgwNzU5MjQxMDE@._V1_SX214_AL_.jpg"})
movie5 = Movie.create({title: "Cat on a Hot Tin Roof", year: 1958, poster_url: "http://ia.media-imdb.com/images/M/MV5BMjA4MDUzNDk4N15BMl5BanBnXkFtZTcwNDYyMjA0Mg@@._V1_SX214_AL_.jpg"})

Role.create(character_name: 'Angie Lowe', movie_id: 1, actor_id: 1)
Role.create(character_name: 'Alexandra del Lago', movie_id: 2, actor_id: 1)
Role.create(character_name: 'Mrs. Duke', movie_id: 3, actor_id: 1)

Role.create(character_name: 'Lennie', movie_id: 1, actor_id: 2)
Role.create(character_name: 'The Thing', movie_id: 4, actor_id: 2)

Role.create(character_name: 'Chance Wayne', movie_id: 2, actor_id: 3)
Role.create(character_name: 'Brick Pollit', movie_id: 5, actor_id: 3)






# create_table "actors", force: true do |t|
#     t.string   "fname"
#     t.string   "lname"
#     t.string   "picture_url"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "movies", force: true do |t|
#     t.string  "title"
#     t.integer "year"
#     t.string  "poster_url"
#   end

#   create_table "roles", force: true do |t|
#     t.integer  "character_name"
#     t.integer  "movie_id"
#     t.integer  "actor_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
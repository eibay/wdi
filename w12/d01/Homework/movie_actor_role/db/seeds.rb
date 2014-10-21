# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie = Movie.create({title: "Love Actually", year: "2003", poster_url: "http://ia.media-imdb.com/images/M/MV5BMTY4NjQ5NDc0Nl5BMl5BanBnXkFtZTYwNjk5NDM3._V1_SX214_AL_.jpg"})

actor = Actor.create({fname: "Hugh", lname: "Grant", picture_url: "http://ia.media-imdb.com/images/M/MV5BMTc4MTgxOTk2Ml5BMl5BanBnXkFtZTcwNzMwMjYwMw@@._V1_SY317_CR11,0,214,317_AL_.jpg"})

role = Role.create({character_name: "David", movie_id: 1, actor_id: 1})
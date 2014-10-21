# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create({title:'Stupid Movie', year:1899})
Movie.create({title:'Bee Movie', year:2007})
Movie.create({title:' Kung Fu Joe', year:1999})

Actor.create({fname:'Joe', lname:'Biggica'})
Actor.create({fname:'Steven', lname:'FakeGuy'})
Actor.create({fname:'Jerry', lname:'Seinfeld'})

Role.create({character_name:'Joe', movie_id:3, actor_id:1})
Role.create({character_name:'Bee', movie_id:2, actor_id:3})
Role.create({character_name:'Stupid Guy', movie_id:1, actor_id:2})
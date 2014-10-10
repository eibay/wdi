require 'date'
require_relative './connection'
require_relative './album'
require_relative './category'
require_relative './client'
require_relative './photo'

Category.delete_all
Photo.delete_all
Album.delete_all
Client.delete_all

wedding = Category.create({name: "wedding"})
family = Category.create({name: "family"})
couple = Category.create({name: "couple"})

pj = Client.create({name: "PJ"})

pjs_wedding_album = Album.create({
  name: "PJ's Wedding", 
  category_id: wedding.id,
  client_id: pj.id,
  event_date: Date.new(2015,06,01)
})



Photo.create({album_id: pjs_wedding_album.id})
Photo.create({album_id: pjs_wedding_album.id})
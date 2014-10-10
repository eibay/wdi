require 'date'
require_relative 'connection'
require_relative 'classes'

Category.delete_all
Photo.delete_all
Album.delete_all
Client.delete_all

wedding = Category.create(name: "wedding")
family = Category.create(name: "family")
couple = Category.create(name: "couple")

pj = Client.create(name: "PJ")

pjs_wedding_album = Album.create({
  title: "PJ's Wedding", 
  category_id: wedding.id,
  client_id: pj.id
})

Photo.create({album_id: pjs_wedding_album.id, taken: Time.now})
Photo.create({album_id: pjs_wedding_album.id, taken: Time.now})
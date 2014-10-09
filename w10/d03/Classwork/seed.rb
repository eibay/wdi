require 'date'
require_relative './db/connection.rb'
require_relative './lib/album.rb'
require_relative './lib/category.rb'
require_relative './lib/client.rb'
require_relative './lib/photo.rb'
require 'active_record'

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
  event_date: Date.new(2015,06,01),
  category_id: wedding.id,
  client_id: pj.id
})

Photo.create({album_id: pjs_wedding_album.id, taken: Time.now})
Photo.create({album_id: pjs_wedding_album.id, taken: Time.now})

require 'pry'
require_relative './lib/connection'
require_relative './lib/album'
require_relative './lib/client'
require_relative './lib/event'
require_relative './lib/photo'


Event.create(name:'Fun Party')
Album.create({name:'Conor Pictures', event_id: 1, client_id:1})
Photo.create(album_id: 1, filename:'alibaba')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artist = Artist.create([{ name: 'Iggy Pop', genre: 'Punk', number_of_albums: 235, photo_url: 'http://ichef.bbci.co.uk/images/ic/240x240/p01vftg2.jpg'}])
artist = Artist.create([{ name: 'The Jon Spencer Blues Explosion', genre: 'Rock', number_of_albums: 11, photo_url: 'http://www.ten-years-after.com/jonspencer/jsbx02.jpg'}])
artist = Artist.create([{ name: 'The Honeymoon Killers', genre: 'Grunge', number_of_albums: 6, photo_url: 'http://c3.cduniverse.ws/resized/250x500/music/190/1540190.jpg'}])


Song.create( name: 'Liquor Store Baby', artist_id: 10)
Song.create( name: 'I Wanna Be Your Dog', artist_id: 5)
Song.create( name: 'Full Grown', artist_id: 7)
Song.create( name: 'Tear It Up', artist_id: 9)
Song.create( name: 'Quiet Village', artist_id: 8)
Song.create( name: 'Quittin Time', artist_id: 6)

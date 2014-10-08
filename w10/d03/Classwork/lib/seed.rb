require "pry"
require_relative "./client"
require_relative "./category"
require_relative "./photo"
require_relative "./album"

Client.delete_all
Category.delete_all
Album.delete_all
Photo.delete_all

clients = [
	{name: "Sheila Jackson"},
	{name: "Aaron Kameini"},
	{name: "Fritz Mackelwhite"},
	{name: "Punky Maseria"}
]

categories = [
	{name: "Wedding"},
	{name: "Engagement"},
	{name: "Birth Announcement"},
	{name: "Graduation"}
]

clients.each { |client| Client.create(client) }
categories.each { |category| Category.create(category) }
albums = [
	{
		client_id: Client.where( {name: "Sheila Jackson"} )[0].id,
		category_id: Category.where( {name: "Graduation"} )[0].id,
		title: "Sheila Jackson PhD",
		event_date: "June 14, 2014"
		},
	{
		client_id: Client.where( {name: "Aaron Kameini"} )[0].id,
		category_id: Category.where( {name: "Birth Announcement"} )[0].id,
		title: "Brocephus, Our New Baby",
		event_date: "October 21, 2006"
	}
]

albums.each { |album| Album.create(album) }
Photo.create({album_id: Album.where( { title: "Brocephus, Our New Baby"} )[0].id, taken: Time.now})
Photo.create({album_id: Album.where( { title: "Brocephus, Our New Baby"} )[0].id, taken: Time.now})
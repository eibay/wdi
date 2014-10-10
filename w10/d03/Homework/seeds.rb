require_relative './connection.rb'
require_relative './models.rb'

Kid.delete_all
Book.delete_all

Kid.create(name: "tom")
Kid.create(name: "sally")
Kid.create(name: "mary")
Kid.create(name: "henry")

Book.create(
	name: "Where the Wild Things Are",
	kids_id: nil
	)

Book.create(
	name: "The Little Prince",
	kids_id: nil
	)

Book.create(
	name: "The Rats of Nimh",
	kids_id: nil
	)
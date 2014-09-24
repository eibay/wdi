require_relative "lib/connection.rb"
require_relative "lib/tshirt.rb"
require_relative "lib/user.rb"
require_relative "lib/order.rb"

Tshirt.create({
	quantity: 78,
	price: 20,
	image: "http://media1.sevenly.org/r/pl/0001918-someone-is-praying-flowy-raglan-1.jpg?0d11ee40",
	})

Tshirt.create({
	quantity: 47,
	price: 22,
	image: "http://media1.sevenly.org/r/pl/0001891-be-the-change-muscle-tank-1.jpg?b4244685",
	})

Tshirt.create({
	quantity: 34,
	price: 24,
	image: "http://media2.sevenly.org/r/pl/0001841-born-free-tee.jpg?120af18c",
	})

Tshirt.create({
	quantity: 5,
	price: 14,
	image: "http://media1.sevenly.org/r/pl/0001828-people-matter-racerback.jpg?ea1f3025",
	})

Tshirt.create({
	quantity: 2,
	price: 12,
	image: "http://media1.sevenly.org/r/pl/0001791-start-with-water-v-neck.jpg?ba297c3a",
	})

Tshirt.create({
	quantity: 23,
	price: 18,
	image: "http://media2.sevenly.org/r/pl/0001742-beauty-flowy-racerback-tank-1.jpg?aec43437",
	})

Tshirt.create({
	quantity: 48,
	price: 20,
	image: "http://media1.sevenly.org/r/pl/0001688-more-than-blood-muscle-tank-1.jpg?e4f130b0",
	})

User.create({
	email: "bob@bob.ly"
	})

Order.create({
	tshirt_id: 5,
	quantity: 2,
	user_id: 1})






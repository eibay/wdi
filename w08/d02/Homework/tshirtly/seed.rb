require_relative './lib/connection.rb'


shirts = [{
		name: "Batman Hush Symbol T-Shirt", 
		price: 20,
		quantity: 100,
		image: "http://ecx.images-amazon.com/images/I/51CiWwc%2BBEL._UL1500_.jpg"},
		{
		name: "Superboy T-Shirt",
		price: 20,
		quantity: 80,
		image: "http://ecx.images-amazon.com/images/I/51BZisWP%2BcL._UL1500_.jpg"},
		{
		name: "Goku Kame T-Shirt",
		price: 18,
		quantity: 40,
		image: "http://ecx.images-amazon.com/images/I/61tFuUqFGGL._UX385_.jpg"
		}]

shirts.each do |s|
	Shirt.create(s)
end


require_relative './lib/connection'
require_relative './lib/customer'
require_relative './lib/order'
require_relative './lib/tshirt'
require 'pry'

customer1 = Customer.create({
	email: "buyerone@buyer.com"
});

customer2 = Customer.create({
	email: "twobuyer@gmail.com"
});

Order.create({
	customer_id: 2,
	fulfilled: true,
	tshirt_id: 1,
	quantity_shirt: 2
	});

Order.create({
	customer_id: 2,
	fulfilled: true
	});

Tshirt.create({
	image: 'http://clothinguk.net/wp-content/uploads/2011/04/rockettshirt-boys-tshirts.jpg',
	name: 'rocket',
	price: 14.99,
	quantity: 88,
	});

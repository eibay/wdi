require 'pry'
require_relative './lib/connection'
require_relative './lib/user'

brenda = User.create({
	name: "Brenda Dargan",
	email_address: "brenda.dargan@gmail.com",
	password_digest: "macy",
	balance: 100,
	account_number: "1234567890"
	})
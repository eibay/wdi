require_relative './db/connection.rb'
require_relative './db/models.rb'

User.create(name: "Tom", email: "Tom@gmail.com", password: "asdf", balance: 100)

User.create(name: "Sally", email: "Sally@gmail.com", password: "fdsa", balance: 500)
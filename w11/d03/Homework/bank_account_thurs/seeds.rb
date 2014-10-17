require_relative './models.rb'
require_relative './connection.rb'

User.delete_all

user1 = User.create(email: "userone@userone.com", password: "helloducky")
user2 = User.create(email: "otheruser@usertwo.com", password: "coldday")
user3 = User.create(email: "thirdguy@gmail.com", password: "chocolate")
user4 = User.create(email: "numberfour@yahoo.com", password: "rainforest")
user5 = User.create(email: "fifthcolumn@userone.com", password: "coffeebad")
user6 = User.create(email: "sixsixsix@thedevil.com", password: "redppen")
user7 = User.create(email: "luckyseven@fortune.com", password: "boulangerie")
user8 = User.create(email: "eightball@poolshark.com", password: "duckgoose")
user9 = User.create(email: "numbernine@beeetles.com", password: "jiveturkey")
user10 = User.create(email: "arealten@userone.com", password: "ohmigod")

account1 = Account.create(balance: 200, user_id: 1)
account2 = Account.create(balance: 100, user_id: 2)
account3 = Account.create(balance: 3, user_id: 3)
account4 = Account.create(balance: 450, user_id: 4)
account5 = Account.create(balance: 20, user_id: 5)
account6 = Account.create(balance: 279, user_id: 6)
account7 = Account.create(balance: 234, user_id: 7)
account8 = Account.create(balance: 12, user_id: 8)
account9 = Account.create(balance: 2090, user_id: 9)
account10 = Account.create(balance: 267, user_id: 10)

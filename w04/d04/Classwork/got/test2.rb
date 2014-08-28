require 'pry'
require_relative './model'
require_relative './house'
require_relative './character'

hash = {name: "Griffin", age: 12}

House.create(hash)


House.create

home = House.find_by("name", "Griffin")
home["id"]

hash
Character.create({name: "Jane", age: 24, home_id: home["id"]})



Character.create({name: "Jane", age: 24, home_id: home[1]["id"]})



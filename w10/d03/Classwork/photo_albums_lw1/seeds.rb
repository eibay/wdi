require 'pry'
require_relative './lib/connection'
require_relative './lib/category'
require_relative './lib/client'
require_relative './lib/photo'
require_relative './lib/album'

Category.delete_all
Client.delete_all
Album.delete_all
Photo.delete_all

wedding = Category.create(name: "wedding")
family = Category.create(name: "family")
couple = Category.create(name: "couple")



# Contact.create(name: "Dona Estela", age: 63, address: "La Hacienda, Tlaxcala, Tlaxcala", phone_number: "453-555-7890", picture: "", category_id: amigos.id)
# Contact.create(name: "Teodoro", age: 62, address: "Plazuela del Carmen Alto, Oaxaca, Oaxaca", phone_number: "678-456-7890", picture: "", category_id: mariachis.id)
# Contact.create(name: "Esperanze", age: 26, address: "6 de Diciembre 34, Morelia, Michuacan", phone_number: "666-776-8660", picture: "", category_id: diablos.id)


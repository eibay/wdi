require 'pry'
require_relative './lib/connection'
require_relative './lib/shirt'


Shirt.create({
  name: "Melting Cube",
  url: "http://a.tgcdn.net/images/products/frontsquare/cb03_melting.jpg",
  price: 25,
  inventory: 10
})

Shirt.create({
  name: "Resistance",
  url: "http://a.tgcdn.net/images/products/frontsquare/resistance.jpg",
  price: 35,
  inventory: 15
})

Shirt.create({
  name: "No",
  url: "http://a.tgcdn.net/images/products/frontsquare/c2dd_no.jpg",
  price: 25,
  inventory: 48
})

Shirt.create({
  name: "Binary",
  url: "http://a.tgcdn.net/images/products/frontsquare/dad.jpg",
  price: 35,
  inventory: 15
})
  

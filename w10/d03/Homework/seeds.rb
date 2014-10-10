require 'date'
require_relative './connection'
require_relative './models'

Member.delete_all
Book.delete_all

bart = Member.create({name: "Bart Simpson"})

Member.create({name: "Ralph Wiggum"})

Member.create({name: "Lisa Simpson"})

Book.create({title: "Good Night Moon", member_id: 0, borrowed_on: "5874896 AD"})

Book.create({title: "Big Book of Pranks", member_id: bart.id, borrowed_on: "10/12/12"})

Book.create({title: "Cat in the Hat", member_id: 0, borrowed_on: "5874896 AD"})


require_relative './db/connection'
require_relative './models/book'
require_relative './models/child'
require_relative './models/borrow'
require 'date'

Child.delete_all
Book.delete_all
Borrow.delete_all

yoyo = Child.create(name: 'yoyo')
jet = Child.create(name: 'jet')
saks = Child.create(name: 'saks')
hud = Child.create(name: 'hud')

portraits = Book.create({title: 'Portraits', child_id: yoyo.id})
janeEyre = Book.create({title: 'Jane Eyre', child_id: hud.id})
windUpBird = Book.create({title: 'The Wind Up Bird', child_id: saks.id})
omnivore = Book.create({title: 'The Omnivores Dilemma', child_id: jet.id})

Borrow.create({
	book_id: portraits.id, 
	child_id: yoyo.id, 
	checked_out: Time.now
	})

Borrow.create({
	book_id: janeEyre.id, 
	child_id: hud.id, 
	checked_out: Time.now
	})

Borrow.create({
	book_id: windUpBird.id, 
	child_id: saks.id, 
	checked_out: Time.now
	})

Borrow.create({
	book_id: omnivore.id, 
	child_id: jet.id, 
	checked_out: Time.now
	})

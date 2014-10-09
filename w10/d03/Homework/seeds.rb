Book.delete_all
Child.delete_all
BorrowedBook.delete_all


Book.create({title: 'Bleeding Edge'})
Book.create({title: 'Neuromancer'})
Book.create({title: 'Zen and the Art of Motorcyle Maintenance'})
Book.create({title: 'Naked Lunch'})
Book.create({title: 'On The Road'})

tom = Child.create({name: 'Tom'})
dick = Child.create({name: 'Dick'})
harry = Child.create({name: 'Harry'})
jane = Child.create({name: 'Jane'})
joanna = Child.create({name: 'Joanna'})

BorrowedBook.create({book_id: 1, child_id: joanna["id"]})
BorrowedBook.create({book_id: 3, child_id: tom["id"]})
BorrowedBook.create({book_id: 4, child_id: jane["id"]})


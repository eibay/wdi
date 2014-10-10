get('/books') do 
	Book.all.to_json
end
post('/books') do
	book = Book.create({name:params[:name]})
	book.to_json
end

put('/books/:id') do
	book = Book.find(params[:id])
	book.update(book_params(params))
	book.to_json
end
delete('/books/:id') do
	book = Book.find(params[:id]).destroy
	book.to_json
end

get('/children') do 
	Child.all.to_json
end

post('/children') do
	book = Child.create({name:params[:name]})
	child.to_json
end

put('/books/:id') do
	child = Child.find(params[:id])
	child.update(child_params(params))
	child.to_json
end
delete('/books/:id') do
	book = Child.find(params[:id]).destroy
	child.to_json
end

get('/children') do 
	Child.all.to_json
end

post('/children') do
	book = Child.create({name:params[:name]})
	child.to_json
end

put('/children/:id') do
	child = Child.find(params[:id])
	child.update(child_params(params))
	child.to_json
end
delete('/children/:id') do
	book = Child.find(params[:id]).destroy
	child.to_json
end

get('/borrowedbooks') do 
	Borrowedbook.all.to_json
end

post('/borrowedbooks') do
	book = Borrowedbook.create({book_id:params[:book_id],child_id:params[:child_id]})
	borrowedbook.to_json
end

put('/borrowedbooks/:id') do
	child = Borrowedbook.find(params[:id])
	child.update(child_params(params))
	borrowedbook.to_json
end
delete('/borrowedbooks/:id') do
	book = Borrowedbook.find(params[:id]).destroy
	borrowedbook.to_json
end


def book_params(params)
  params.slice(*Book.column_names)
end
def child_params(params)
  params.slice(*Child.column_names)
end
def borrowedbooks_params(params)
  params.slice(*Borrowedbook.column_names)
end
# Active Record notes run queries in pry
# RESTful -  a standardized convention for making APIs

Album.where(client_id: pj.id)
Category.find_by(name: "wedding")
Album.where(category_id)
Album.first
some_album = Album.first
Photo.where({album_id: self.id})
Client.all
Photo.where(album_id: Album.first.id)


# list all resources
Album.all          /albums       GET 

# Get one resource
Album.find(3)      /albums/3     GET


Album.create({})   /albums       POST   
	                 /albums/3     PUT
	                 /albums/3     DELETE
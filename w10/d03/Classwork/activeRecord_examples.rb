# Active Record notes run queries in pry

Album.where(client_id: pj.id)
Category.find_by(name: "wedding")
Album.where(category_id)
Album.first
some_album = Album.first
Photo.where({album_id: self.id})
Client.all
Photo.where(album_id: Album.first.id)
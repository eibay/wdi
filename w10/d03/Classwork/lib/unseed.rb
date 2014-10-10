require_relative "./client"
require_relative "./category"
require_relative "./album"
require_relative "./photo"

Client.delete_all
Category.delete_all
Album.delete_all
Photo.delete_all
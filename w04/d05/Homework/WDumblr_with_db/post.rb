require_relative './model'
require_relative './image'

class Post < ActiveRecord::Base

	def author
		author_id = @attributes["author_id"]
		author = Author.find_by("id", author_id)
		return author
	end

	def add_image(url, post_id, tag)
		image = {url: url, post_id: post_id, tag: tag}
		Image.create(image)
	end


	def images
		id = @attributes['id']
		images = Image.select_by("post_id", id)
		return images

	end



end

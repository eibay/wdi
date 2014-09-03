require 'pry'
require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "jeff",
  :database => "wdumblr"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Author < ActiveRecord::Base
  def posts
    Post.where({ author_id: self.id })
  end
end

class Post < ActiveRecord::Base
  def whatever
    return "HEY this post is titled #{self.title}"
  end

  def author
    Author.find_by({id: self.author_id})
  end
end

binding.pry
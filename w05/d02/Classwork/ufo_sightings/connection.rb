require 'active_record'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "heidi",
    :database => "ufo_sightings"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)



=begin
class Post < ActiveRecord::Base
  def whatever
    return "HEY this post is titled #{self.title}"
  end

  def author
    Author.find_by({id: self.author_id})
  end
end=end


binding.pry
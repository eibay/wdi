require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "clayreed",
  :database => "kinds_of_dogs"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
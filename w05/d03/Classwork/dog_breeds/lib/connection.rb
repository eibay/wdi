require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "heidiwilliams",
  :database => "dog_breeds"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
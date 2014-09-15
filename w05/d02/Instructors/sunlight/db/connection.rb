require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "jeff",
  :database => "sunlight"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
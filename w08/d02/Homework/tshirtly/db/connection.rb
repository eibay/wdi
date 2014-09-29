require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "medusa",
  :database => "tshirtly"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)

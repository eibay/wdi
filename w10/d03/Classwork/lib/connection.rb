require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "Conor",
  :database => "photo_test"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)

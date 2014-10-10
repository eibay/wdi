require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "jeff",
  :database => "photography"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)

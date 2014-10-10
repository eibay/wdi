require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "lisa",
  :database => "photography"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
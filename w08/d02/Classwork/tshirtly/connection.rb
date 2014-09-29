require 'active_record'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "grampus",
  :database => "shirtly"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
require 'active_record'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "heidi",
  :database => "legislators"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
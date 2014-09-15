require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "shotaro",
  :database => "heathers_characters"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
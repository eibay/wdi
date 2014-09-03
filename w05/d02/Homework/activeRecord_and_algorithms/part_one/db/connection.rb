require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "shotaro",
  :database => "w05d02hw"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
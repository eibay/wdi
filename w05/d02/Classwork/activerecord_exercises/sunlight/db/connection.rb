require 'active_record'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "jeffcampomanes",
  :database => "congress"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
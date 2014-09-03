require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "jeffcampomanes",
  :database => "numbers_exercise"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
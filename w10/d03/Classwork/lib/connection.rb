require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "timoorkurdi",
  :database => "smileforthecamera"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "heidiwilliams",
  :database => "got_ar"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
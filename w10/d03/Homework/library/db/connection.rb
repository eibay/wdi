require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "joebiggica",
  :database => "library"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
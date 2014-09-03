require 'active_record'
require 'pry'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "IrisMartinez",
  :database => "congress"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)
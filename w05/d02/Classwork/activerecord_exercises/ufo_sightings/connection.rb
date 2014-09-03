require 'pry'
require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "IrisMartinez",
  :database => "ufos"
})
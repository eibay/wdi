require 'active_record'
require_relative "./client"
require_relative "./category"
require_relative "./photo"
require_relative "./album"

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "grampus",
  :database => "photographer"
})
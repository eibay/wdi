require "active_record"
require_relative "./user"

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "grampus",
  :database => "bankofdan"
})
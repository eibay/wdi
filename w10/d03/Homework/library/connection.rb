require "active_record"
require_relative "./borrower"
require_relative "./book"


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "grampus",
  :database => "library"
})
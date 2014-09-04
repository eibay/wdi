require "pry"
require "httparty"
require_relative "./connection"
require_relative "./breed"

ActiveRecord::Base.logger = Logger.new(STDOUT)

binding.pry
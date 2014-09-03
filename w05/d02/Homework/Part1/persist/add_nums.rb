require_relative './connection.rb'
require_relative './lib/number.rb'
require 'active_record'
require 'pg'

if Number.count > 0
  return "error, numbers already in database"
else
  30.times do 
    n = Number.new
    n[:number] = rand(100)
    n.save
  end
end
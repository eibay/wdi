require 'pry'
require 'HTTParty'

require_relative './senator_information.rb'
require_relative './connection.rb'

puts "Whats the first name of the senator are you lookind for?"
name = gets.chomp.capitalize

Senator.all.each do |element|
  if name == element.first
    puts element.first, element.last, element.state, element.bioguide_id, element.party, element.birthday
    
  end
end
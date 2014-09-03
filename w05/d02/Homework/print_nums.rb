require_relative './connection.rb'
require_relative './numbers.rb'
numbers = []
data = Number.all.order(number: :desc)
data.each do |prime|
  
  #breaking the Number.all gives us instances
  if prime.isPrime == true
 
    puts prime.number
  end
end

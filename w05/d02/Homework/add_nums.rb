require_relative './connection.rb'
require_relative './numbers.rb'
i = 0
while i < 30
if Number.all.length < 31
  number = rand(1..30)
  Number.create({number: number})
end
i += 1
end
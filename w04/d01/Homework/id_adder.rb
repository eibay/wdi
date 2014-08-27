require_relative './lib/objects.rb'
require 'securerandom'

mechs = Mech.all()

mech = mechs.each do |x|
	x["id"] = SecureRandom.hex
end
Mech.create(mech)
puts mechs
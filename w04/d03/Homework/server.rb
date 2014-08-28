require_relative './taxi'
require_relative './user'
puts "taxi or user?"
answer = gets.chomp.downcase
	if answer == "taxi"
		taxiInfo = {"driver_name" => "Tom", "city" => "Toledo", "color" => "yellow"}
		taxidriver = Taxi.new(taxiInfo)
		taxidriver.showInfo
	elsif answer == "user"
		puts "yes"
		counter = 0
		while counter <= 9
			newuser = User.random_user
			counter += 1
		end
	end



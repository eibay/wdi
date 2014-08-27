require "json"
require "securerandom"

class Car
	def self.get_data
		data_car = JSON.parse(File.read('./cars.txt'))
	end

	def self.create
		data_car = self.get_data

		puts "car capacity"
		capacity = gets.chomp
		puts "colour?"
		colour = gets.chomp
		puts "honk style?"
		klaxon = gets.chomp

		id = SecureRandom.hex


		car = {id: id, capacity: capacity, colour: colour, klaxon: klaxon}

		data_car << car

		File.write("./cars.txt", data_car.to_json)
	end

	def self.list
		data_car = self.get_data

		data_car.each do |car|
			puts "ID: #{car['id']}"
			puts "Capacity: #{car['capacity']}"
			puts "Colour: #{car['colour']}"
			puts "Honk style: #{car['klaxon']}"
			puts " "
		end
	end


	def self.select_by(key, value)
		data_car = self.get_data
		data_car.find_all do |car|
			car[key] == value
		end
	end

end
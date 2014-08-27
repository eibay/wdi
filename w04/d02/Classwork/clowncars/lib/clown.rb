require "json"
require "securerandom"

class Clown
	def self.get_data
		data_clown = JSON.parse(File.read('./clowns.txt'))
	end

	def self.create()
		data_clown = self.get_data

		puts "foot size?"
		size_feet = gets.chomp
		puts "is he sad?"
		is_sad = gets.chomp
		puts "can he drive?"
		can_drive = gets.chomp

		id = SecureRandom.hex


		clown = {id: id, size_feet: size_feet, is_sad: is_sad, can_drive: can_drive}

		data_clown << clown

		File.write("./clowns.txt", data_clown.to_json)
	end

	def self.list()
		data_clown = self.get_data

		data_clown.each do |clown|
			puts "ID: #{clown['id']}"
			puts "Feet size: #{clown['size_feet']}"
			puts "Is sad?: #{clown['is_sad']}"
			puts "Can drive?: #{clown['can_drive']}"
			puts " "
		end
	end

	def self.select_by(key, value)
		data_clown = self.get_data
		data_clown.find_all do |clown|
			clown[key] == value
		end
	end

	def self.assign_clownmobile()
		data_clown = self.get_data

		data_car = JSON.parse(File.read('./cars.txt'))


		id_cars = []
		data_car.each do |car|
			id_cars << car["id"]
		end

		data_clown.each do |clown|
			clown["car_id"] = data_car[rand(data_car.length)]
		end
		####### assigns entire car data, dunno why #######

	end

end


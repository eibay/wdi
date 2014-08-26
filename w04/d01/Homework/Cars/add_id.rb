require 'securerandom'
require 'pry'
require 'json'

cars = JSON.parse(File.read('./cars.txt'))

cars.each do | car, keys |
	 unless car[keys].include?("id")
		car["id"] = SecureRandom.hex
		car << car[id]
	end
end

    cars_json = JSON.generate(cars)
    File.write('./cars.txt', cars_json)

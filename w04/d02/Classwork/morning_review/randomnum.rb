require 'securerandom'

cars = JSON.parse(File.read("./cars.txt"))

cars.each do | car |

	unless car[key]include?(:id)
		car[id] = SecureRandom.hex
		cars << car[id]
	end
end

cars_json = JSON.parse.generate(cars)
File.write('./cars.txt', cars_json)


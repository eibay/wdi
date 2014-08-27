require 'securerandom'
require 'json'

class Astro
	def self.create(astro)
		astros = self.all()

		astro["a_id"] = SecureRandom.hex
		astros << astro

		astros_json = JSON.generate(astros)
		File.write('./astros.txt', astros_json)
	end

	def self.find_by(key, value)
		self.all().find do |astro|
			astro[key] == value
		end
	end

	def self.select_by(key, value)
		self.all().select do |astro|
			astro[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./astros.txt'))
	end

end
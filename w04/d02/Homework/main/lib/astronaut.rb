require 'json'
require 'pry'
require 'securerandom'
require 'sinatra/reloader'

class Astronaut

	def self.get_data()
		JSON.parse(File.read('./astronauts.txt'))
	end

  def self.create(astronaut)
    data = self.get_data()
    astronaut["id"] = SecureRandom.hex

    data << astronaut
    File.write("./astronauts.txt", data.to_json)
  end

  def self.search(key, value)
    data = self.get_data()
    data.find do |astronaut|
      astronaut[key] == value
    end
  end

  def self.search_all(key, value)
    data = self.get_data()
    data.find_all do |astronaut|
      astronaut[key] == value
    end
  end

end
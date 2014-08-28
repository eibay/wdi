require 'json'
require 'pry'
require 'securerandom'
require 'sinatra/reloader'

class Shuttle

  def self.get_data()
    JSON.parse(File.read('./shuttles.txt'))
  end

  def self.create(shuttle)
    data = self.get_data()
    shuttle["id"] = SecureRandom.hex
    # shuttle = {"id" => SecureRandom.hex, "name" => name.capitalize, "origin" => origin.capitalize, "destination" => destination.capitalize}
    data << shuttle
    File.write("./shuttles.txt", data.to_json)
  end

  def self.search(key, value)
    data = self.get_data()
    data.find do |shuttle|
      shuttle[key] == value
    end
  end

  def self.search_all(key, value)
    data = self.get_data()
    data.find_all do |shuttle|
      shuttle[key] == value
    end
  end

end
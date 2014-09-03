require 'json'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "shotaro",
  :database => "sightings"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Ufo < ActiveRecord::Base
end

ufo = File.read('ufo_formatted.json')
ufo_json = JSON.parse(ufo)

ufo_json.each do |ufo|
	data = Ufo.new(ufo)
	data.save
end

binding.pry
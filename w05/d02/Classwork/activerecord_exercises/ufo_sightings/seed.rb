require 'json'
require 'active_record'

ActiveRecord::Base.establish_connection({
		:adapter => "postgresql",
		:host => "localhost",
		:username => "brendadargan",
		:database => "sightings"
		})

ActiveRecord::Base.logger = Logger.new(STDOUT)

# after do // for Sinatra
# 	ActiveRecord::Base.connection.close
# end

ufos = JSON.parse(File.read('./ufo_formatted.json'))

class Ufo < ActiveRecord::Base
	#use a semantic name for Class. Sighting would be better in this case.
end

	ufos.each do |entry|
		ufo = Ufo.create(entry)
		ufo.save
	end


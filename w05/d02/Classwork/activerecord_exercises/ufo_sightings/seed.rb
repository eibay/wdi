require 'JSON'
require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "susrutcarpenter",
  :database => "sightings"
  })

ActiveRecord::Base.logger = Logger.new(STDOUT)


records = JSON.parse(File.read('./ufo_formatted.json'))

class Ufo < ActiveRecord::Base
  
end

Ufo.delete_all
#to make the stuff delete

records.each do |record|
  ufo = Ufo.create(record)
end

#could use .new and then save



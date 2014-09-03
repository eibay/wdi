require 'active_record'
require 'json'
require 'pry'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "j9",
    :database => "ufos"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)

  class Sightings < ActiveRecord::Base
  end

  ufo=File.read('ufo_formatted.json')
  parsed_ufo= JSON.parse(ufo)

  parsed_ufo.each do |ufo|
  data = Sightings.new(sighted_at: element["sighted_at"], reported_at: element["reported_at"], location: element["location"], shape: element["shape"], duration: element["duration"], description: element["description"])
  data.save

  end

binding.pry
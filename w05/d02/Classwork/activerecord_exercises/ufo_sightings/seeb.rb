require 'json'
require 'pry'

require_relative './connection'

class Ufo < ActiveRecord::Base
end


ufo_data = JSON.parse(File.read("./ufo_formatted.json"))

ufo_data.each do |d|
  Ufo.create({reported_at: d["reported_at"], sighted_at: d["sighted_at"], location: d["location"], shape: d["shape"], duration: d["duration"]})
end

binding.pry
require_relative './model.rb'
require_relative '../connection.rb'
require "securerandom"

class Image < ActiveRecord::Base

  def self.post(key, value)
    self.all().select do |entity|
      entity[key] == value
    end
  end

end







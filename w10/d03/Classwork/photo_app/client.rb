require 'active_record'

class Client < ActiveRecord::Base
  def albums
    Album.where({client_id: id})
  end
end
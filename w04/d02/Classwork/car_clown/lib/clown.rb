require 'securerandom'
require 'json'

class Clown
  # def initialize(name, can_drive=false, shoe_size=13, is_sad=true, id=SecureRandom.hex )
  #   @name = name
  #   @can_drive = can_drive
  #   @shoe_size = shoe_size
  #   @is_sad = is_sad
  #   @id = id
  # end
  #

  def self.create(name)
    clown_name = name
    id = SecureRandom.hex
    can_drive = [true, false].sample
    shoe_size = (8..16).to_a.sample #generates random shoe size from array
    is_sad = [true, false].sample

    name = {id: id, name: clown_name, can_drive: can_drive, shoe_size: shoe_size, is_sad: is_sad}

    Clown.all()
    clowns << name
    clowns_json = JSON.generate(clowns)
    File.write('./clowns.txt', clowns_json)
  end

  def self.all()
    clowns = JSON.parse(File.read('clowns.txt'))
  end

end

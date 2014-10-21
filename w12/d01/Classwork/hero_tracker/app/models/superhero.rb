class Superhero < ActiveRecord::Base
	belongs_to :city

  def valid_superhero?
    if (self.name.blank? || self.real_identity.blank?)
      return false
    end

    return true
  end
end
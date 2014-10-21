class City < ActiveRecord::Base
	self.has_many(:superheros)

	root 'superheros#show'
end


class Puppy < ActiveRecord::Base
	validates :cuteness, numericality: { only_integer: true, greater_than: -1, less_than: 6 }
end
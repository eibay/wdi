class Artist < ActiveRecord::Base
   has_many :songs, dependent: :destroy
   validates :name, presence: true,
                    length: { minimum: 5 }
end
require "active_record"
require "pry"

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "grampus",
  :database => "ufos"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)


class Sighting < ActiveRecord::Base
end
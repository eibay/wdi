 require 'active_record'
 require 'pg'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "medusa",
    :database => "ufos"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)


class Sighting < ActiveRecord::Base
end

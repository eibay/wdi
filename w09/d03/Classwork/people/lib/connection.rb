require 'active_record'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "lisa",
    :database => "people_power"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)
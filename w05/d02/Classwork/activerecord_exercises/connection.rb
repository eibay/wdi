  require 'active_record'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "jortenberg",
    :database => "ufos"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)
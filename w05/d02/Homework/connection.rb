  require 'active_record'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "Conor",
    :database => "numbers"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)
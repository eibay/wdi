require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "Conor",
  :database => "groceries"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)

require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "",
  :database => ""
})

ActiveRecord::Base.logger = Logger.new(STDOUT)


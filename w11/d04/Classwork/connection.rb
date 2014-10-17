require 'active_record'

ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "medusa",
    :database => "password_test"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)


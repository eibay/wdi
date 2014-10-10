require 'active_record'

ActiveRecord::Base.establish_connection({
      :adapter => "postgresql",
      :host => "localhost",
      :username => "grampus",
      :database => "grocerylist"
    })

ActiveRecord::Base.logger = Logger.new(STDOUT)
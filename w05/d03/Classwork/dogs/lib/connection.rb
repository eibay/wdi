require 'active_record'

ActiveRecord::Base.establish_connection({
:adapter => "postgresql",
:host => "localhost",
:username => "susrutcarpenter",
:database => "breeds"
})
ActiveRecord::Base.logger = Logger.new(STDOUT)
require 'active_record'

ActiveRecord::Base.establish_connection({
:adapter => "postgresql",
:host => "localhost",
:username => "susrutcarpenter",
:database => "randoms"
})
ActiveRecord::Base.logger = Logger.new(STDOUT)
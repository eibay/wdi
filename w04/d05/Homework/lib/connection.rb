require 'active_record'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "shotarokamgeai",
    :database => "wdumblr"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)
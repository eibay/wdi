 require 'active_record'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "im11041991",
    :database => "wdumblr"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)
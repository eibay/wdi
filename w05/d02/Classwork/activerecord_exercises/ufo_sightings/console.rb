require 'pry'
require 'json'
require 'active_record'

ufo = JSON.parse(File.read('ufo_formatted.json'))

ActiveRecord::Base.establish_connection({
	:adaptor => "postgresql",
	:host => "localhost",
	:username => "alex",
	:database => "ufo"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)


class UFO < ActiveRecord::Base


end


binding.pry
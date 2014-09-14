require 'active_record'

ActiveRecord::Base.establish_connection({
	 adapter: "postgresql",
	    host: "localhost",
	username: "clayreed",
	database: "random_rosencrantzer_db"
})
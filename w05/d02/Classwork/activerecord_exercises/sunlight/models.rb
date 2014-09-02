require 'active_record'

# establish connection to postgres #

ActiveRecord::Base.establish_connection(
   adapter: "postgresql",
      host: "localhost",
  database: "sunlight_api",
  username: "clayreed",
  password: '',
  encoding: "utf-8", 
      port: "5432"
)


# create senator class # 

class Senator < ActiveRecord::Base 
end 

class Bill < ActiveRecord::Base 
end 
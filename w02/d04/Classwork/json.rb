require 'json'

json = "{\"weather\":\"69 F\",\"humidity\":\"56%\",\"hash_crap\":true}\n"
hash = JSON.parse(json)
puts hash
jsonhash = JSON.generate(hash)
puts jsonhash
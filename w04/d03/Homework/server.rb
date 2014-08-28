require_relative './lib/taxi'
require_relative './lib/user'

# attr = {driver_name:"Tim", city:"New York", color:"Black"}

# taxi1 = Taxi.new(attr)
# taxi1.getInfo

attr = {first_name:"Tim", last_name:"Jordan", gender:"male", city:"New York", state:"NY"}

taxi1 = Taxi.new(attr)
taxi1.getInfo
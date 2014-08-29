require_relative './model'

class Character < Model

 def faction
 	Faction.find_by("id", @attributes["faction_id"])
 end


end






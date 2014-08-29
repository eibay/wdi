require_relative './model'

class Faction < Model

def characters
	Character.select_by("faction_id", @attributes["id"])
end





end




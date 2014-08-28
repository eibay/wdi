require_relative './comedian_instructor'

comedians = []

kevin_hart = Comedian.new("Kevin Hart", 40, "yo mama so fat that she dont need the internet she's already world wide")

rusell_peters = Comedian.new("Rusell Peters", 40, "Insert joke here")

chris_rock = Comedian.new("Chris Rock", 40, "Insert another joke here")

comedians << kevin_hart
comedians << rusell_peters
comedians << chris_rock

comedians.each do |comedian|
  comedian.tell_joke
end

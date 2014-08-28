class Shirt

  def initialize(size, color, text)
    @size = size
    @color = color
    @text = text
   end

   def threads
     puts "I love my classic #{@size} #{@color} #{@text} shirt! "
     puts "I miss the 90's as well Jeff!"
end

  def newer_threads
    puts "I also love my #{@size} #{@color} #{@text} shirt! "
    puts "Anybody got a Pabst Blue Ribbon?"
end

end

pearl_jam_t = Shirt.new("extra-large", "faded black", "Yield Tour 1998")
puts pearl_jam_t.threads

hipster_plaid = Shirt.new("medium", "red", "NO LOGO")
puts hipster_plaid.newer_threads

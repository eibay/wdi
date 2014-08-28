class Comedian
  def initialize(name, fav_joke)
    @name = name
    @fav_joke = fav_joke
  end

  def fish
    puts "¿que is algo y nada a la vez?"
    response = gets.chomp
    puts "un pez"
  end

  def bus
    puts "What did the Korean bus driver say to the egg?"
    response = gets.chomp
    puts "계란"
  end

  def pencil
    puts "Wanna see a magic trick?"
    response = gets.chomp
    puts "I'm going to make this pencil.. disappear"
  end

  def loop
    puts "how loopy are you for the punchline?"
    response = gets.chomp
    while true
      puts "."
    end
  end

  def joke
    puts @fav_joke
  end

end

class NumAdd
@numbers = []
  def self.added(input)
    input = input.delete("add ")
    @numbers << input.to_i
    return "#{input} added!"
  end

  def self.show
    return @numbers
  end
end

loop do
  puts "Please enter a command"
  input = gets.chomp
  NumAdd.added(input)

  puts "Please enter a command"
  input = gets.chomp
    if input == "show"
      print NumAdd.show()
      puts
    else
      NumAdd.added(input)
    end
end

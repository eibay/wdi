
# If the user wants to add a number they simply type add 5 or add 30 and your program 
#should add a number to the list
# If the user wants to show the numbers they type show and all numbers 
#currently added to the list should be displayed to the user in a comma-separated format
# Repeat the process and ask the user for their next command
require 'pry'

class List
  def initialize()
    @list_of_numbers = []
  end

  def list(number)
    puts "Please enter a command"
    puts number
    @list_of_numbers.push(number)
    return "Please enter a command"
  end

  def show()
  	puts "show"
    return @list_of_numbers
  end
end





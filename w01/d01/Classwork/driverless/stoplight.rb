light = gets.chomp
puts("stop") if light == "red"
puts("slow down") if light == "yellow"
puts("go") if light == "green"


=begin
red = "stop"
yellow = "slow down"
green = "go"
light = red
puts light

light{red=>"stop", yellow=>"slow down", green=>"go"}
puts light[red]	
=end
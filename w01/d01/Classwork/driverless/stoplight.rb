#@lights=["green", "yellow" ,"red"]
puts ("what color is the light?")
#light= @lights.sample
light =  gets.chomp

if light=="red" #stop light is red so tell the car to stop
	puts("stop")
	
elsif light=="green" #stop light is green so tell the car to go
	puts ("go")

elsif light=="yellow" #stop light is yellow so tell the car to slow down
	puts("slow down")
end

	
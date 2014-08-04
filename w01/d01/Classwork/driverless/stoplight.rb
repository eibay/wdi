puts("Light?")
light = gets.chomp

if light == "red"
	puts("stop")
elsif light == "yellow"
	puts("yield")
elsif light == "green"
	puts("go")
else
	puts("nono")
end

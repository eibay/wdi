zoo={lion: ["John", "Steve", "Kevin"], flamingo: ["Carl","Pedro", "Jacques"]}

zoo[:bears]=["Lisa,", "Rodrigo", "Claire"]
zoo[:flamingo].push("Rich","Pete", "Becca")



puts zoo[:flamingo][4]
if zoo[:bears].include? "Rodrigo"
	puts "Yes there is a bear named Rodrigo"
end


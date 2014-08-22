require 'pry'
epiArr = []
csv = File.read('./greys.txt')
charArr = []
binding.pry
csv.split("\n").each { 
	|x| charArr<<{character: x.split(",")[0], actor: x.split(",")[1], episodes: x.split(",")[2].split(" ")[0].to_i,  
		# (if x.split(",")[3].length == 4 
		# 	start_year: x.split(",")[3],
		# 	end_year: x.split(",")[3] 
		# else start_year: x.split(",")[3].split("-")[0]
		# 	end_year: x.split(",")[3].split("-")[1] 
		# end)
	}
}
puts "stars, minor, docs, 2007"
command = gets.chomp.downcase
if command == "stars"
	binding.pry
	charArr[0].each do |x| 
		if x[:episodes].split(" ")[0].to_i > 150
			epiArr<<x[:actor]
		end
	end
end
	puts epiArr

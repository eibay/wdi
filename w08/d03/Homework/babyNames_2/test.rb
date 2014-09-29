require 'pry'
require 'json'



babys = JSON.parse(File.read('./public/ny-baby-names.json'))
babys = babys["data"]
babys_2012 = []
babys_2011 = []

babys.each do |baby|
	if baby[8] == "2012"
		babys_2012.push(baby)
	elsif baby[8] == "2011"
		babys_2011.push(baby)
	end
end

babys2012_json = babys_2012.to_json
babys2011_json = babys_2011.to_json

binding.pry

puts "Hello World"





# /////////////////
# babys[1..50].each do |baby|
# 				  baby[9].capitalize
# 				  baby[10].capitalize
# 				  baby[11]
# 				  baby[12]
# end

# i = 0
# while i <= 100
# if babys["data"][i][8] == "2012"
# babys["data"][i][9].capitalize %></td>
# babys["data"][i][10].capitalize %></td> 
# babys["data"][i][11] %></td>
# babys["data"][i][12]
# 	end
# 		  i += 1
# 		  end
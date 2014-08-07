
inp = [ 
  ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
  ["Neel Patel", "neel.patel@generalassemb.ly"],
  ["Sean West", "sean.west@generalassemb.ly"],
  ["Jake Schwartz", "j@generalassemb.ly"],
  ["Brad Jacobs", "brad@google.com"],
  ["Cynthia Silvers", "cynthia@google.com"],
  ["Summer Sanders", "summer.sanders@nickelodeon.com"],
  ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]

i = 0
histogram = {} 
while i < inp.length-1 

	# extract the name & addr 
	name = inp[i][0] 
	addr = inp[i][1] 
	
	# output addr for testing 
	# puts addr 

	# break them down into component parts 
	name_arr = name.split(" ").each(&:downcase!) 
	name_no = name_arr.length 

	addr_arr = addr.split "@" 
	username = addr_arr[0]
	domain = addr_arr[1] 	

	case name_no  
	when 1
		first = name_arr[0]
		if "#{first}" == username 
			puts "It's \"first\"" 
		else 
			puts "I can't find a pattern"
		end 
	when 2 
		first, last = name_arr
		regex = "/" + first + "_." + last + "/" 
		# str representing a regex, assumes a strange letter
		# in the middle of an addr is 
		# a middle initial 
		if "#{first}.#{last}" == username
			puts "It's \"first.last\""
		elsif "#{first}" == username 
			puts "It's \"first\"" 
		elsif first + last == username 
			puts "It's \"firstlast\""
		elsif ((eval regex) =~ username) == 0 
			puts "It's \"first_initiallast\"" 
		else 
			puts "I can't find a pattern"
		end 
	when 3
		first, middle, last = name_arr 
		if "#{first}.#{last}" == username
			puts "It's \"first.last\""
		elsif "#{first}" == username 
			puts "It's \"first\"" 
		elsif first + last == username 
			puts "It's \"firstlast\""
		elsif first + middle[0] + last == username  
			puts "It's \"first_initiallast\"" 
		else 
			puts "I can't find a pattern"
		end 
	end 

	i += 1  
end 





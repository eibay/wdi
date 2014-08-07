
in = [ 
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

while i < in.length-1 
	# extract the name & addr 
	name = in[i][0] 
	addr = in[i][1] 
	# break them down into component parts 
	name_arr = name.split(" ").each(&:downcase!) 
	name_no = name.length 

	addr_arr = addr.split "@" 
	username = addr_arr[0]
	domain = addr_arr[1] 
	
	# str represents a regex, assumes a strange letter
	# in the middle of an addr is 
	# a middle initial 
	regex = "/" + first + "_." + last + "/" 

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
		if "#{first}.#{last}" == username
			puts "It's \"first.last\""
		elsif "#{first}" == username 
			puts "It's \"first\"" 
		elsif first + last == username 
			puts "It's \"firstlast\""
		elsif (regex.eval =~ username) == 0 
			puts "It's \"first_initiallast\"" 
		else 
			puts "I can't find a pattern"
		end 
	when 3
		first, middle, last == name_arr 
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





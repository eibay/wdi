
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

output = {}

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
			if output.has_key? domain 
				if output[domain].has_key? "first"
					output[domain]["first"] += 1 
				else 
					output[domain]["first"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["first"] = 1 
			end 
		else 
			if output.has_key? domain 
				if output[domain].has_key? "unknown"
					output[domain]["unknown"] += 1 
				else 
					output[domain]["unknown"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["unknown"] = 1 
			end 
		end 
	when 2 
		first, last = name_arr
		regex = "/" + first + "_." + last + "/" 
		# str representing a regex, assumes a strange letter
		# in the middle of an addr is 
		# a middle initial 
		if "#{first}.#{last}" == username
			if output.has_key? domain 
				if output[domain].has_key? "first.last"
					output[domain]["first.last"] += 1 
				else 
					output[domain]["first.last"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["first.last"] = 1 
			end 
		elsif "#{first}" == username 
			if output.has_key? domain 
				if output[domain].has_key? "first"
					output[domain]["first"] += 1 
				else 
					output[domain]["first"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["first"] = 1 
			end 
		elsif first + last == username 
			if output.has_key? domain 
				if output[domain].has_key? "firstlast"
					output[domain]["firstlast"] += 1 
				else 
					output[domain]["firstlast"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["firstlast"] = 1 
			end 
		elsif ((eval regex) =~ username) == 0 
			if output.has_key? domain 
				if output[domain].has_key? "first_initiallast"
					output[domain]["first_initiallast"] += 1 
				else 
					output[domain]["first_initiallast"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["first_initiallast"] = 1 
			end  
		else 
			if output.has_key? domain 
				if output[domain].has_key? "unknown"
					output[domain]["unknown"] += 1 
				else 
					output[domain]["unknown"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["unknown"] = 1 
			end 
		end 
	when 3
		first, middle, last = name_arr 
		if "#{first}.#{last}" == username
			if output.has_key? domain 
				if output[domain].has_key? "first.last"
					output[domain]["first.last"] += 1 
				else 
					output[domain]["first.last"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["first.last"] = 1 
			end 
		elsif "#{first}" == username 
			if output.has_key? domain 
				if output[domain].has_key? "first"
					output[domain]["first"] += 1 
				else 
					output[domain]["first"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["first"] = 1 
			end 
		elsif first + last == username 
			if output.has_key? domain 
				if output[domain].has_key? "firstlast"
					output[domain]["firstlast"] += 1 
				else 
					output[domain]["firstlast"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["firstlast"] = 1 
			end 
		elsif first + middle[0] + last == username  
			if output.has_key? domain 
				if output[domain].has_key? "first_initiallast"
					output[domain]["first_initiallast"] += 1 
				else 
					output[domain]["first_initiallast"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["first_initiallast"] = 1 
			end  
		else 
			if output.has_key? domain 
				if output[domain].has_key? "unknown"
					output[domain]["unknown"] += 1 
				else 
					output[domain]["unknown"] = 1 
				end 
			else
				output[domain] = {}
				output[domain]["unknown"] = 1 
			end 
		end 
	end 
	i += 1 
end 


puts output 




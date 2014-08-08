require 'pry'
# use pry for debugging 

=begin 
# Tess found this 

class String 
	def initial 
		self[0,1]
	end 
end 
=end 

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

# output a histogram 
output = {}

while i < inp.length-1 

	# extract the name & addr 
	name = inp[i][0] 
	addr = inp[i][1] 
	
	# output addr for testing 
	# puts addr 

	# break them down into component parts 
	name_arr = name.downcase!.split " " 
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
				# not too sure there is not a more 
				# concise way to do this: 
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

input = [
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]

emit = []


input.each do |guesswork|
	# parse name 
	guessing = guesswork[0]
	name_arr = guessing.split " "
	name_no = name_arr.length 
	# becoming lazy here
	unless name_no == 2 
		abort "Please use first & last name only. Please pardon the inconvience while we work on our logic."
	end 
	first, last = name_arr.each(&:downcase!)

	# parse domian 
	domain = guesswork[1] 

	# parse histogram 
	bestguess = output[domain].sort_by {|k,v| v}.pop[0]
	 
	case bestguess
	when "first.last"
		emit << [guessing, "#{first}.#{last}@#{domain}"]
	when "first"
		emit << [guessing, "#{first}@#{domain}"]
	when "firstlast"
		emit << [guessing, (first + last)]
	when "first_initiallast"
		# refractor to make look like above logic 
		emit << [guessing, "#{first}_?#{last}@#{domain}"]
	when "unknown"
		puts "Can't perdict for #{domain}"
	end 

end 

emit.each do |pair|
	name, perdicted = pair 
	puts "For #{name},", "I perdict \033[1;31;43m#{perdicted}\033[0m."
end  

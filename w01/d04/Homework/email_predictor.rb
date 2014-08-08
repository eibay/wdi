


name_email = ["Brad Jacobs", "brad.jacobs@google.com"]
	# [0] "Brad Jacobs",
 	# [1] "brad.jacobs@google.com"

name = name_email[0].split(" ")
	# [0] "Brad",
 	# [1] "Jacobs"

name2 = name_email[0].split("")
	# [ 0] "B",
    # [ 1] "r",
    # [ 2] "a",
    # [ 3] "d",
    # [ 4] " ",
    # [ 5] "J",
    # [ 6] "a",
    # [ 7] "c",
    # [ 8] "o",
    # [ 9] "b",
    # [10] "s"


email = name_email[1].split("@")
	# [0] "brad.jacobs",
 	# [1] "google.com"

if (name[0] + "." + name[1]).downcase == (email[0]).downcase
  
puts "The name/email provided follows pattern a"


elsif name[0].downcase == email[0].downcase
    #b

elsif (name[0] + name[1]).downcase == email[0].downcase
    #c

elsif (name2[0] + name[1]).downcase == email[0].downcase
    #d

else
	puts "doesn/'t match any patterns"

    


# pattern {

# 	a. first.last (ie, jeffery.konowitch)
# 	b. first (ie, jeffery)
# 	c. firstlast (ie, jefferykonowitch)
# 	d. first-initiallast (ie, jkonowitch)
# 	e. doesnt match any pattens
# }

end


# names_emails = [ 
#   ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
#   ["Neel Patel", "neel.patel@generalassemb.ly"],
#   ["Sean West", "sean.west@generalassemb.ly"],
#   ["Jake Schwartz", "j@generalassemb.ly"],
#   ["Brad Jacobs", "brad@google.com"],
#   ["Cynthia Silvers", "cynthia@google.com"],
#   ["Summer Sanders", "summer.sanders@nickelodeon.com"],
#   ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
# ]
# tally = {
# "generalassembly" => [ a: 0, b: 0, c: 0, d: 0, e: 0 ],
# "google" => [ a: 0, b: 0, c: 0, d: 0, e: 0 ],
# "nickelodeon" => [ a: 0, b: 0, c: 0, d: 0, e: 0 ],
# }

# x = 0
# while x < 8
# 	namepair = names_emails[x][0].split(" ")
# 	firstname = namepair[0].downcase
# 	first_all_letters = firstname.split("")
# 	firstinit = first_all_letters[0]
# lastname = namepair[1].downcase 
# addresspair = names_emails[x][1].split("@")
# addressname = addresspair[0]

# if addresspair[1] == "generalassemb.ly"
# if firstname + "." + lastname == addressname
# puts "a ga"
# tally["generalassembly"][0][:a] +=1
# elsif firstname == addressname
# puts "b ga"
# tally["generalassembly"][0][:b] +=1
# elsif firstname + lastname == addressname
# puts "c ga"
# tally["generalassembly"][0][:c] +=1
# elsif firstinit + lastname == addressname
# puts "d ga"
# tally["generalassembly"][0][:D] +=1
# else 
# puts "e ga"
# tally["generalassembly"][0][:e] +=1
# end
# end
# if addresspair[1] == "google.com"
# if firstname + "." + lastname == addressname
# tally["google"][0][:a] +=1
# puts "a goo"
# elsif firstname == addressname
# tally["google"][0][:b] +=1
# puts "b goo"
# elsif firstname + lastname == addressname
# tally["google"][0][:c] +=1
# puts "c goo"
# elsif firstinit + lastname == addressname
# tally["google"][0][:D] +=1
# puts "d goo"
# else 
# tally["google"][0][:e] +=1
# puts "e goo"
# end
# end
# if addresspair[1] == "nickelodeon.com"
# if firstname + "." + lastname == addressname
# puts "a nick"
# tally["nickelodeon"][0][:a] +=1
# elsif firstname == addressname
# puts "b nick"
# tally["nickelodeon"][0][:b] +=1
# elsif firstname + lastname == addressname
# puts "c nick"
# tally["nickelodeon"][0][:c] +=1
# elsif firstinit + lastname == addressname
# puts "d nick"
# tally["nickelodeon"][0][:D] +=1
# else 
# puts "e nick"
# tally["nickelodeon"][0][:e] +=1
# end
# end
# x += 1
# end
# puts tally






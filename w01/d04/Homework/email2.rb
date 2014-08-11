names_emails = [ 
  ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
  ["Neel Patel", "neel.patel@generalassemb.ly"],
  ["Sean West", "sean.west@generalassemb.ly"],
  ["Jake Schwartz", "j@generalassemb.ly"],
  ["Brad Jacobs", "brad@google.com"],
  ["Cynthia Silvers", "cynthia@google.com"],
  ["Summer Sanders", "summer.sanders@nickelodeon.com"],
  ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]
####write a method to predict potential email addresses based on domains
def predict_email(name, domain, email_list)
	index=0
	domains= {
  "generalassemb.ly" => [a: 0, b: 0, c: 0, d: 0, e: 0],
  "google.com" => [a: 0, b: 0, c: 0, d: 0, e: 0],
  "nickelodeon.com" => [a: 0, b: 0, c: 0, d: 0, e: 0],
}
while index < email_list.count

split_name=email_list[index][0].split(" ")
split_first=split_name[0].downcase
split_last=split_name[1].downcase
split_address=email_list[index][1].split("@")
emaiL_first=split_address[0]
email_second=split_address[1]
if email_second=="generalassemb.ly"
	if "#{split_first}.#{split_last}"==split_address[0]
	
	
    
   	domains["generalassemb.ly"][0][:a]+=1
elsif split_first==split_address[0]
	
	domains["generalassemb.ly"][0][:b]+=1

elsif "#{split_first}#{split_last}"==split_address[0]
	
	domains["generalassemb.ly"][0][:c]+=1

elsif "#{split_first[0]}#{split_last}"==split_address[0]
	
		domains["generalassemb.ly"][0][:d]+=1
else

		domains["generalassemb.ly"][0][:e]+=1
end
elsif email_second=="google.com"

	if "#{split_first}.#{split_last}"==split_address[0]
	
	
    	domains["google.com"][0][:a]+=1
elsif split_first==split_address[0]
	
 domains["google.com"][0][:b]+=1

elsif "#{split_first}#{split_last}"==split_address[0]
	
	domains["google.com"][0][:c]+=1

elsif "#{split_first[0]}#{split_last}"==split_address[0]
	
	domains["google.com"][0][:d]+=1
else
	
	domains["google.com"][0][:e]+=1
end
elsif email_second=="nickelodeon.com"

	if "#{split_first}.#{split_last}"==split_address[0]
	

    domains["nickelodeon.com"][0][:a]+=1
elsif split_first==split_address[0]
	
	domains["nickelodeon.com"][0][:b]+=1
elsif "#{split_first}#{split_last}"==split_address[0]
	
	domains["nickelodeon.com"][0][:c]+=1

elsif "#{split_first[0]}#{split_last}"==split_address[0]
	
	domains["nickelodeon.com"][0][:d]+=1
else
	
	domains["nickelodeon.com"][0][:e]+=1
end
end
index +=1
end
email_guess=[name, domain]
if email_guess[1]=="generalassemb.ly"
	max_pattern=domains["generalassemb.ly"][0].max_by{|k,v| v}[0]
elsif email_guess[1]=="google.com"
	max_pattern=domains["google.com"][0].max_by{|k,v| v}[0]
elsif email_guess[1]=="nickelodeon.com"
	max_pattern=domains["nickelodeon.com"][0].max_by{|k,v| v}[0]
end
split_name_guess= email_guess[0].split(" ")
split_first_guess=split_name_guess[0].downcase
split_last_guess=split_name_guess[1].downcase
if max_pattern==:a
	
		puts("Our best guest for this email is #{split_first_guess}.#{split_last_guess}@#{email_guess[1]}")
	
		elsif max_pattern==:b
		puts("our best guess for this email #{split_first_guess}@#{email_guess[1]}")
	elsif max_pattern==:c
		puts("Our best guess for this email is {split_first}#{}{split_last}@{email_guess[1]}")
	elsif max_pattern==:d
		puts("Our best guess for this email is #{split_first[0]}#{split_last}@#{email_guess[1]}")
	elsif max_pattern==:e
		puts"No Pattern could be detected"


end
end
puts "What is the name of the person whose email you are trying to guess?"
name=gets.chomp
puts "What is the domain of the person whose email you are trying to guess?"
email=gets.chomp
predict_email(name, email, names_emails)
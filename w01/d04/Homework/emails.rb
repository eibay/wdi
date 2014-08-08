
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

frequency = {
	"generalassemb.ly" => { a: 0, b: 0, c: 0, d: 0, e: 0 }, 
	"google.com" => { a: 0, b: 0, c: 0, d: 0, e: 0 }, 
	"nickelodeon.com" => { a: 0, b: 0, c: 0, d: 0, e: 0 }
}

def classification(first, last, email, frequency)
	
	user_name = email.split("@")[0]
	domain = email.split("@")[1]

	if first + "." +last == user_name 
		frequency[domain][:a] += 1
		puts "This belongs in a"


	elsif first == user_name
		frequency[domain][:b] += 1
		puts "This belongs in b"


	elsif first+last == user_name
		frequency[domain][:c] += 1
		puts "This belongs in c"


	elsif first.split("")[0]+last == user_name
		frequency[domain][:d] += 1
		puts "This belongs in d"
	

	else
		frequency[domain][:e] += 1
		puts "Doesn't match any patterns"


	end

end


names_emails_index = 0

# first_name = names_emails[names_emails_index][0].split(" ")[0].downcase
# last_name = names_emails[names_emails_index][0].split(" ")[1].downcase
# email = names_emails[names_emails_index][1]



while names_emails_index < names_emails.length


	#classification(first_name, last_name, email, frequency)
	classification(names_emails[names_emails_index][0].split(" ")[0].downcase, names_emails[names_emails_index][0].split(" ")[1].downcase, names_emails[names_emails_index][1], frequency)
	names_emails_index += 1

end


###############################################


def a(first, last, domain)
	return first + "." + last + "@" + domain
end

def b(first, last, domain)
	return first + "@" + domain
end

def c(first, last, domain)
	return first + last + "@" + domain
end

def d(first, last, domain)
	return first.split[0] + "." + last + "@" + domain
end



names_domains = [
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]

names_domains_index = 0

while names_domains_index < names_domains.length

domain = names_domains[names_domains_index][1]
first_name = names_domains[names_domains_index][0].split[0].downcase
last_name = names_domains[names_domains_index][0].split[1].downcase

	if domain == "generalassemb.ly"
		
		max_ga = frequency["generalassemb.ly"].max_by{|k,v| v}[0]  
		
		if max_ga == :a
			puts a(first_name, last_name, domain)
		elsif max_ga == :b
			puts b(first_name, last_name, domain)
		elsif max_ga == :c
			puts b(first_name, last_name, domain)
		elsif max_ga == :d
			puts d(first_name, last_name, domain)
		else
			puts "Cannot Predict"	
		end

	elsif domain == "google.com"

		max_google = frequency["google.com"].max_by{|k,v| v}[0]  
		
		if max_google == :a
			puts a(first_name, last_name, domain)
		elsif max_google == :b
			puts b(first_name, last_name, domain)
		elsif max_google == :c
			puts b(first_name, last_name, domain)
		elsif max_google == :d
			puts d(first_name, last_name, domain)
		else
			puts "Cannot Predict"	
		end

	else

		max_nick = frequency["nickelodeon.com"].max_by{|k,v| v}[0] 
		
		if max_nick == :a
			puts a(first_name, last_name, domain)
		elsif max_nick == :b
			puts b(first_name, last_name, domain)
		elsif max_nick == :c
			puts b(first_name, last_name, domain)
		elsif max_nick == :d
			puts d(first_name, last_name, domain)
		else
			puts "Cannot Predict"	
		end

	end
	
	names_domains_index += 1

end














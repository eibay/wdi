predict_emails = [  
	["PJ Hughes", "generalassemb.ly"],
	["Eric Schmidt", "google.com"],
	["Kel Mitchell", "nickelodeon.com"]
]
 
	

y=0 
while y < predict_emails.length
	predict_emails[y][0].downcase!
 	y += 1
end 

x=0

emails = {

}
name=[]
email=[]
while x < predict_emails.length 
	name = predict_emails[x][0] 
	email = predict_emails[x][1] 

	 if email == "generalassemb.ly"
	 	print name[0].to_s << "." << name[1].to_s << "generalassemb.ly"
	 elsif email == "google.com"
	 	puts name[0].to_s << "google.com"
	 elsif email == "nickelodeon.com"
	 	puts name[0].to_s << "." << name[1].to_s << "nickelodeon.com"
	 else 
	 	puts "Can't perdict that email"
 end

x += 1
end	


#can't get this code to work properly-- will work on :0 
require 'pp'

emails = {}

pp emails 

load = %w(emails["Harry\ Potter"]\ =\ "harry.potter@hogwarts.edu"
	emails["Hermione\ Granger"]\ =\ "hermione.granger@hogwarts.edu"
	emails["Ronald\ Weasley"]\ =\ "ronald.weasley@hogwarts.edu"
	emails["Arthur\ Weasley"]\ =\ "arthur_weasley@ministryofmagic.gov.uk"
	emails["Mr.\ Garrick"]\ =\ "garrick@olivanderswands.co.uk") 

load.each do |e|
	eval e 
	pp emails 
end

pp emails.key "hermione.granger@hogwarts.edu" 
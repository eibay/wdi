require 'pry'
require 'socket'

#server = TCPServer.new 2000

all_characters = File.read('greys_test.txt')

characters = all_characters.split("\n")                                                                                                             

people = []
# Hoping this is going to be the array of hashes
the_characters = []

#this gives me the array of arrays named people
characters.each do |person|                                                                                                      
	people << person.split(",")                                                                                               
end                                                                                                                         
# this constructs the hash for each character
one_character = {}
people.each do |x|

	one_character[:actor] = x[0]
	one_character[:role] = x[1]
	one_character[:episode_count] = x[2]
	one_character[:year] = x[3]
	the_characters << one_character
end

binding.pry
#loop do 







#{}"Linda Jossana,ER Nurse,1 episode,2013\nLaura Kranz,ER Nurse,1 episode,2013\nRyan Robertson,Best Man,1 episode,2013\nToni-Marie Spera,Brad's Cousin,1 episode,2013\nAlexandra Swarens,Carly,1 episode,2013\nChristine Weatherup,Crystal,1 episode,2013\nGeoffrey Arend,Thom,1 episode,2014\nAlanna Boatright,Marie,1 episode,2014\nW. Earl Brown,Herb Cramer,1 episode,2014\nLydia Castro,Marilyn Rocher,1 episode,2014\nLisa Joffrey,Kim Cole,1 episode,2014\nWilfred Lopez,X-Ray Tech,1 episode,2014\nAlyson Reed,Anne from HR,1 episode,2014\nCharlotte Alexis White,Alyssa Cramer,1 episode,2014"











	
#end
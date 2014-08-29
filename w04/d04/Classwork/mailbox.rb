require "json"

class Mailbox

	# def self.all
	# 	mailbox = JSON.parse(File.read("./mailbox.txt"))
	# end

	# def deliver(mail)
	# 	mailbox = self.all
	# 	message = {}
	# 	message[:from] = mail[:from]
	# 	message[:message] = mail[:message]
	# 	mailbox << message
	# 	File.write("./mailbox.txt", mailbox.to_json)
	# end

	# def received_mail
	# 	return self.all
	# end
	@@all_mail = []  #this is class variable 

	def initialize()
		@mail_container =[] #you establish a shared data structure
	end						#by putting it in the initialize, or 
							#

	def deliver(mail)
		@mail_container.push(mail)
	end

	def received_mail()
		return @mail_container
	end


end
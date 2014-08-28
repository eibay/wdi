# mailbox
# create a new mailbox
# mailbox = Mailbox.new ()
# mailbox.deliver
#mailbox.recieved_mail
require 'pry'

class Mailbox

	def initialize()
		puts "You've got messages."
	end

	def mailbox.deliver (message)
		@from = message[:from]
		@message = message[:message]
	end

	def mailbox.recieved_mail()
		message_array = []
		array = array {from: from, message: message}
	end

mailbox.deliver = Mailbox.new ("from your mom, message: I love you. Why don't you call")
mailbox.recieved_mail = Mailbox.new ("from you mom, message: I love you, Why don't you call")


########################################################
 class Mailbox

 	def initialize()
 		# needs to be a shared variable among the methods, so put it in the intialize method
		@mail_container = []
	end

 	def deliver(mail)
 		#what do i do with the mail?
 		@mail_container.push(mail)
 		# in this scenario, we don't want to return the array, only a personal message.
 		# return @mail_container.push(mail)
 		return "Delivered the message."
 	end

 	def recieved_mail ()
 		# where is the received mail?
 		return @mail_container
 	end
 end


mailbox = Mailbox.new
puts mailbox.deliver = Mailbox.new ({from: your mom message: I love you. Why dont you call })
puts mailbox.recieved_mail


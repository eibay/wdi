require 'pry'

class Mailbox

	#mailbox = Mailbox.new()
	#message = "I love you, why don't you call? Love, Mom"
	
	def initialize
		@mail_container = []
	end

	def deliver(mail)

		@mail_container.push(mail)

		return "Delivered!"
	end

	def received_mail()
		return @mail_container
	 end
end



#I want to create the mailbox. I need to initialize the mailbox and the message.
#I want to deliver a message to the mailbox.
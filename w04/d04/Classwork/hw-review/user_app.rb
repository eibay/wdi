# create a new Mailbox
# mailbox = Mailbox.new()
# mailbox.deliver({ from: "Your Mom"...})
# => mailbox.received_mail
#=> [{}, {}]
require 'pry'

class Mailbox
# can establish instance variables in any instance method
	def initialize
		@box = []
	end

	def deliver(mail)
		@box << mail
		return "Delivered!"
	end

	def received_mail
		return @box
		# puts "From: " message[:from] ", Message:" message[:message]  
	end

end

message1 = { from: "Your Mom", message: "Call me." }
message2 = { from: "Someone", message: "I'm surprised." }

mailbox = Mailbox.new

mailbox.deliver(message1)

mailbox.received_mail

your_mailbox = Mailbox.new

your_mailbox.deliver({from: "sdfasfd", message: "asdfsdfsadf"})

your_mailbox.received_mail


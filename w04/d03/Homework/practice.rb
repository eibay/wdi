require 'pry'

class Mailbox
	
	def initialize
		@all = []
	end

	def deliver(mail)
		@all.push(mail)
	end


	def received_mail
		return @all
	end

end

mail1 = { from: "Your Mom", message: "I love you"}
mail2= { from: "Holly", message: "sunflower"}

mailbox = Mailbox.new

mailbox.deliver(mail1)
mailbox.deliver(mail2)

puts mailbox.received_mail

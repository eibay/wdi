
require 'pry'

class Mailbox
	def initialize()
		@letters = []		
	end 

	def deliver(mail)
		
		@letters.push(mail)

		return "Delivered!"
	end 

	def received_mail

		return @letters   
	end

end


box = Mailbox.new

letter_1 = {:from => "Your Mom", :message => "I love you. Why don't you call?"}

box.deliver(letter_1)


puts box.received_mail


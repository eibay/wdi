class Mailbox

	def initialize
		puts "Welcome to your new email box."	
		@received = []
	end

	def deliver(email)
		@email = email
		@received << @email
	end

	def received_mail
		puts @received
	end

end

myMail = Mailbox.new
myMail.deliver({from: "Your Mom", message: "I love you, why don't you call?"})
myMail.deliver({from: "Uncle Tony", message: "I like you face"})
puts myMail.received_mail
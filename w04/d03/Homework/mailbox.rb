#mailbox

#create a new Mailbox

#mailbox = Mailbox.new()

#mailbox.deliver({from: "Your Mom", message: "I love you. Why don't you call?"})

#mailbox.received_mail
#=> [{ from: "Your Mom", message: "I love you. Why don't you call?"}]

#mailbox.deliver({from: "Uncle Tony", message: "I like you face"})

#mailbox.received_mail
#=> [{ from: "Your Mom", message: "I love you. Why don't you call?"}, {from: "Uncle Tony", message: "I like you face."}]

#hint: use an array internally to organize all the mail received 

require 'pry'

class Mailbox

	def initialize()
		@mail_container = []

	end


	def deliver(mail)
		#what do i do with this mail which is a hash
		@mail_container.push(mail)
	
		return "Delivered!"
	end

	def received_mail()
	# where is the mail???
	return @mail_container	
	end
end


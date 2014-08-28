require 'pry'

class Mailbox

	def initialize()
		@mail_container = []
	end

	def deliver(mail)
		@mail_container.push(mail)
		return "Delivered"
	end

	def received_mail
		return @mail_container
	end

end
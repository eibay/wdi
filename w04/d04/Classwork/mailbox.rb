require 'pry'



class Mailbox

	def intitialize()
		@mail_container = []
	end

	def deliver(mail)
		@mail_container << mail
		return "Delivered!"
	end

	def received_mail
		return @mail_container
	end
end

binding.pry

mymail = MailBox.new
yourmail = MailBox.new
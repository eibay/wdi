require 'pry'
class Mailbox

	def initialize()

	@mail_container = []

	end

	def deliver(mail)

		#what do I do with this mail
		@mail_container.push(mail)

		return "Deliver!"

	end

	def recieved_mail()#not inputing we're just taking all the msg/mail
		#where is the mail???

		return mail_container
end
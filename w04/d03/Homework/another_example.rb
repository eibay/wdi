
class Mailbox
	binding.pry

	def initialize(from, to, message)
		@from = from
		@to = to
		@message = message
	end

	def deliver
		mail_message = "This mail is from: #{@from}, and being delivered to #{@to}. The message is #{@message}"
		return mail_message
	end

	def self.received_mail
		mail = []
		mail.push(mail_message)
		return mail
	end
end
		


class Mailbox

	def initialize()
		@attributes = hash
	end


	def deliver
		mail_message = "This mail is from: #{@attributes[:from]}, and being delivered to #{@attributes[:to]}. The message is #{@attributes[:message]}"
		return mail_message
	end

	def self.received_mail
		mail = []
		mail.push(mail_message)
		return mail
	end
end
		

class Mailbox
	
# 	def initialize()
		
# 	end

# 	def self.deliver(hash)
# 		@atts = hash
# 	end

# 	def self.received_mail(hash)
# 		mail = []
# 		mail.push(hash)
# 		return mail
# 	end	
# end




	def initialize()
		@mail_container = []
	end

	def deliver(mail)
		@mail_container.push(mail)

		return "Delivered!"
	end

	def received_mail()
		return @mail_container
	end
end
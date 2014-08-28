require 'pry'

# class MailBox
# 	def initialize(hash)
# 		# @attributes = hash
# 		@from = hash[:from]
# 		@message = hash[:message]
# 		@address = hash[:address]
# 		@time = hash[:time]
# 	end

# 	def receivedMail
# 		puts "From: #{@from}, Messgae: #{@message}"
# 	end	

# 	def deliver
# 		puts "To: "
# 	end
# end

class MailBox
	def initialize()
		@mail_container = []
	end

	def deliver(mail)
		@mail_container.push(mail)
	end	

	def received_mail()
		return @mail_container
	end
end

binding.pry




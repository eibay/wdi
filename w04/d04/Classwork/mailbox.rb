
require 'pry'
class Mailbox

	attr_accessor :received




	def deliver(attributes)
		 @attributes=attributes
		 @recieved=[]
		@received.push(@attributes)
		return "delivered"
	end
	

	def received_mail()
		puts @received
	end
		
	end

binding.pry


class Mailbox 

	attr_accessor :inbox, :outbox, :trash 
	attr_reader :user_name 

	def self.all 
		ObjectSpace.each_object(self).to_a 
	end 

	def initialize user_name

		# ensure a username is unique # 
		mailbox_array = Mailbox.all
		until !mailbox_array.include? user_name
			puts "#{user_name} is already taken."
			puts "Please choose another."
			user_name = gets.chomp 
		end 

		@user_name = user_name 
		@inbox = []
		@outbox = []
		@trash = []
	end 

	def send_message message, to

		# find the reciever #
		reciever = Mailbox.all.find do |mailbox| 
			mailbox.user_name == to 
		end 

		
		if reciever.nil?
			# if there're no users w/ that name, save it in sender's outbox # 
			puts "Your message could not be sent."
			puts "I have placed it in your outbox."

			self.outbox << message 
		else 
			# else put the message in reciever's inbox # 
			reciever.inbox << message 

			puts "Your message has been sent."
		end 
	end 
end 

# demonstrate functionality #

m = Mailbox.new "Mom"
c = Mailbox.new "Clayton"

c.send_message "Mom, help! I don't know how to clean my glasses!", "Mom"

puts m.inbox

m.send_message "Clay, help! I don't know how to use email!", "Clay"
puts m.outbox
require "securerandom"
require "pry"
require "json"

class Mailbox

	def initialize(id = "new")
		all = JSON.parse(File.read("./mail.txt"))
		if id == "new"
			@id = SecureRandom.hex
			@inbox = []
			all[@id] = @inbox
			File.write("./mail.txt", JSON.generate(all))
		else
			@inbox = all[id]
			@id = id
		end
	end


	

	def deliver(hash)
		@inbox << hash
		all = JSON.parse(File.read("./mail.txt"))
		all[@id] = @inbox
		all_json = JSON.generate(all)
		File.write("./mail.txt", all_json)
	end

	def received_mail
		@inbox[@id]
	end



end

binding.pry
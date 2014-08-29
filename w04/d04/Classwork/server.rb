require_relative './mail'

hash = {
	from: "Your mom",
	message: "I love you.  Why don't you call?"
}

mailbox = Mailbox.new()
mail = Mailbox.deliver(hash)
puts mail

mail = Mailbox.received_mail(mail)
puts mail
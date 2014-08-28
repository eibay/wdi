require 'pry'

class Mailbox
  def initialize()
    @mail_container = []
  end

  def deliver(mail)
    # what do I do with this mail (hash)
    @mail_container.push(mail)

    return "Delivered!"
  end

  def received_mail()
    # where is the mail????
    return @mail_container
  end
end

binding.pry
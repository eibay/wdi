
class Mailbox

  def initialize()
    @inbox = []
  end

  def deliver(sender, message)
    mail = {sender: sender, message: message}
    @inbox << mail
    return "Mail sent."
  end

  def received_mail()
    return @inbox
  end

end


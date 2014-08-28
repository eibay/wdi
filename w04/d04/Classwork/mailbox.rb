require 'pry'

class Mailbox

  def initialize
    @mail = Array.new
  end

  def received_mail

    return @mail
  end

  def deliver(mail)
     @mail << mail
     return "Delivered!"
  end

end

binding.pry

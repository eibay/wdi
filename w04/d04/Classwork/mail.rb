require 'pry'

class Mailbox
  def initialize
    @attributes = []
  end

  # def [](key)
  #   return @attributes[key]
  # end

  def deliver (newmail)
      @attributes << newmail
      return newmail
  end

  def received_mail
       # return mails = @attributes.map {|mail|mail}
       #map does what each does but returns an array so can take it out
       return @attributes
      end
  end
   #can only return one thing so have to break it down after 
  



mailbox = Mailbox.new
mailbox.deliver({from:"Mom"})
mailbox.deliver({from: "YO"})
mailbox.received_mail.each do |mail|
  puts mail
end


  
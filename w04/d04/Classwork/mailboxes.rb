require 'pry'
require_relative './mailbox'

mailbox = Mailbox.new()

mailbox.deliver({from: "Your Mom", message: "I love you. Why don't you call?"}

mailbox.received_mail
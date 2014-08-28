require 'pry'
require_relative './lib/mailbox'


hash = {from: "Your Mom", message: "I love you. Why don't you call?", address:"mom@gmail.com" time:"#{Time.new}"}

new_mail = MailBox.new(hash)

binding.pry

# MailBox.deliver

new_mail.receivedMail
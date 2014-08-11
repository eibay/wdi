require 'socket'

#hard of hearing

server = TCPServer.new 2000
client = server.accept

user_said = client.gets.chomp
client.puts user_said

client.puts "Did you hear what I said?"

second_user_said = client.gets.chomp.downcase
client puts "I said #{second_user_said}!"

final_user_said = client.gets.chomp
client.puts "Would you consider wearing a hearing aid?"

last_user_said = client.gets.chomp.downcase

if last_user_said == "yes" 
client.puts "I realize that I have a serious hearing problem."

elsif last_user_said == "no" 
client.puts "I like being able to tune people out."

else
client.puts "error"
end

client.close


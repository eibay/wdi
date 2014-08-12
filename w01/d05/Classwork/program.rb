require "socket"
server = TCPServer.new 2000

while true
	client = server.accept
	puts "Client connected!"
	client.puts "<h1>Helloooo there</h1> <h4>Small words</h4> <p> paragraph</p> <a href='http://10.199.173.19:2000'>this is a link to Iris's website</a> 
	<a href='http://www.youtube.com/watch?v=7PrwJxZfBH8'> This is a link to my favorite youtube show</a> <img src='http://www.freesmileys.org/smileys/smiley-gen014.gif' alt='Yay! You made it to my webpage'>"


	request = client.gets.chomp

	client.puts " "


	puts request

	client.close
end
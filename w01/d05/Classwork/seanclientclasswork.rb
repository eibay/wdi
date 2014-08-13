require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts " <h1> Hello <i> beautiful stranger. </i> </h1> 
  				<h4> If you are reading this, then you have successfully done this exercise. </h4>
  				<li> GREAT </li>
  				<li> JOB </li>
  				<li> HORRAYYYYYY </li>
  				<h2> <u> Now get out. </u> </h2>
  				<a href= '10.10.24.79:2000'> seriously, get out! </a>"
  request = client.read # what the browser is saying. #gets.chomp reads the first line. #read reads all the lines
  puts request # what the browser is saying viewed on terminal
  client.close
end
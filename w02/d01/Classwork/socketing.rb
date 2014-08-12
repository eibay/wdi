require 'socket'
server = TCPServer.new 2000

ips = {Dan: "10.234.13.141", Conor: "10.90.129.103", Iris: "10.199.173.19", Sean: "92.168.40.152", Brenda: "10.27.164.144",
 Tess: "10.105.37.231", Crawford: "10.42.11.28", Adrian: "10.106.190.97", Yoshie: "10.129.12.227", Janine: "10.10.24.79", 
 Tejal: "10.44.122.26", Andrea: "10.190.2.98", Shotaro: "10.124.218.232", Joe: "10.241.19.40", Alex: "10.16.200.11", Lisa: "10.197.79.113", 
 Trish: "10.85.145.118", Clayton: "10.171.234.149", Jeffrey: "10.32.126.134", Natassia: "10.231.192.140", Timoor: "10.75.182.74", Heidi: "10.58.23.9", Jill: "10.238.66.111"}

while true
	client = server.accept

	puts "Client connected!"

	client.puts "<h1>Hell World</h1> <h3>You have reached a new ring of hell</h3> <h4>See who else is here</h4>"
	ips.each {|x, y| client.puts "<a float='left' href= 'http://#{y}:2000'>#{x.to_s}</a>"}
	# request = client.read
	# puts request

	client.close
end
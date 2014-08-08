require 'socket'

$server = TCPServer.new 1999   
$client = $server.accept  

class String 

	# sends str to client's screen 
	def server_says 
		$client.puts self 
	end  

	# move color codes to synaesthetically 
	# named methods   
	def friendily 
		"\033[0;45;1;33m" + self + "\033[0m"
	end 

	def significantly 
		"\033[1;34m" + self + "\033[0m" 
	end 

	def with_emphasis 
		"\033[1;31m" + self + "\033[0m"
	end 

	def hopefully 
		"\033[44;1;37m" + self + "\033[0m"
	end 

	def loudly 
		"\033[1;32m" + self + "\033[0m"
	end 

	def warmly 
		"\033[1;33m" + self + "\033[0m"
	end 
end 

def client_speaks  
	$client.gets 
end 

"Good afternoon".server_says
"Care to enter an input?".server_says

loop do 
	
	"Type one of these: hello, echo [any number of words], ping, or guess
	To end the session type \"end\"".friendily.server_says
	however = client_speaks 
	however = however.split ' '
	what, *ever = however 

	case what 
	when "hello"
		what = what.upcase + '!'
		what.server_says 
	when "echo"
		("You said " + ever.join(' ')).server_says
	when "ping"
		what[1] = 'o' 
		what.server_says 
	when "guess"
		no = rand(9) + 1  
		("I'm thinking of a number between " + "1".with_emphasis + " and " + "10".significantly).server_says
		g = 0 
		while (g != no) do 
			g = client_speaks.to_i 
			if g == no 
				"correct!".loudly.server_says
			else 
				"That's not the number I'm thinking of".server_says 
				"Try again".warmly.server_says
			end
		end 
	when "end"
		"See you.".hopefully.server_says 
		$client.close  
	else 
		"I hear you speaking, but I don't understand you".server_says
	end 

end 

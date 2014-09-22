require 'socket'
require 'webrick'
require 'erb'
require 'pry'

@app_name = "Little Waists"
@things = []
@header_partial = <<H_PARTIAL
<header>
	<h1><%= @app_name %></h1>
</header>
H_PARTIAL

@header_partial = ERB.new @header_partial
@header_partial = @header_partial.result binding

def mk_view w 
	f = "./views/#{w}/index.html.erb"
	f = File.read f 
	e = ERB.new f 
	e.result binding 
end 

s = TCPServer.new 2000 

loop do 
	c = s.accept 
	r = WEBrick::HTTPRequest.new WEBrick::Config::HTTP 
	r.parse c 

	if r.path == '/' && r.request_method == "GET"
		v = mk_view "home"
		c.puts v 
	elsif r.path == "/things"
		if r.request_method == "POST"
			@things << r.query 
			puts @things 
			v = mk_view "things"
			c.puts v 
		else
			v = mk_view "things"
			c.puts v 
		end 
	elsif r.path == "/styles" && r.request_method == "POST"
		css = File.read "./stylesheets/styles.css"
		c.puts css
	end 

	c.close 

end 
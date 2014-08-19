require 'socket'
require 'webrick'
require 'erb'
require 'pry'
require 'httparty'
require 'yaml'

s = TCPServer.new 2000
@app_name = "Hash of Hearts"  
@cloud = {}
@nav_bar_links = [{link: "about", href: "/about"}, {link: "home", href: '/'}, {link: "the cloud", href: "/cloud" }]

@header_partial = <<HEADER_PARTIAL 
<header>
	<h1><%= @app_name %></h1> 
	<nav>
		<ul>
			<% #perhaps this is silly %>
			<% @nav_bar_links.each do |l| %>
				<li>
					<a href=<%= l[:href] %>><%= l[:link] %></a>
				</li> 
			<% end %> 
		</ul>
	</nav> 
</header> 
HEADER_PARTIAL

# transform the header partial 
@header_partial = ERB.new @header_partial
@header_partial = @header_partial.result binding 

def send_erb_view which  
	f = "./views/#{which}/index.html.erb" 
	f = File.read f 
	e = ERB.new f 
	e.result binding 
end 


@access_token = "4ad7cc36c172434588afd340aa74cd01"  
def tagged so
	# remove possible chars we don't want # 
	so.delete! '+' 
	so.delete! "%20"
	url = "https://api.instagram.com/v1/tags/#{so}/media/recent?client_id=#{@access_token}"
	HTTParty.get url 
end 
 
  # transforms search results from Instagram
  # into easily manipulatable data 
def transform results
	hash = results["data"]
	if hash.nil?
		return results  
	else 
		hash.map do |image|
			img = image["images"]["standard_resolution"]["url"]
			unless image["caption"].nil?  
				username = image["caption"]["from"]["username"]
			else 
				username = ''
			end 
		
			[img, username]
		end 
	end
end 

loop do 


	c = s.accept 

	r = WEBrick::HTTPRequest.new WEBrick::Config::HTTP 
	r.parse c

	if r.path == '/' && r.request_method == "GET" 
		@view_name = "land"
		v = send_erb_view @view_name
		c.puts v 
	elsif r.path == "/see" && r.request_method == "GET" 
		@view_name = "see"

		# MAKE A Hash OF Hearts 
		@t = r.query["tag"]
		@imgs = tagged @t
		@imgs = transform @imgs
		@imgs.slice! 0, 9

		v = send_erb_view @view_name
		c.puts v 

	elsif r.path == "/about" && r.request_method == "GET"
		@view_name = "info"

		v = send_erb_view @view_name
		c.puts v 


	elsif r.path == "/cloud" 
		@view_name = "cloud"

		if r.request_method == "POST"
			
			# MAKE A Hash OF Hearts 
			@t = r.query["t"] 
			@imgs = tagged @t 
			@imgs = transform @imgs 
			@imgs.slice! 0, 9 

			@cloud[@t] = @imgs  

			v = send_erb_view @view_name
			c.puts v 
		else

			v = send_erb_view @view_name
			c.puts v  
		end 

	end 

	c.close 
end 
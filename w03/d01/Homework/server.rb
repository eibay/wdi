require "erb"
require "socket"
require "httparty" 

# set up variables # 

$access_token = "4ad7cc36c172434588afd340aa74cd01"
s = TCPServer.new 1999

fof = <<FOUR_OH_FOUR
<!DOCTYPE html>
<html lang=en>
<head>
	<meta charset=utf-8>
	<title>404 Not Found</title>
</head>
<body>
	<section>
		<h1>404 Not Found</h1>
		<p>This means the thing was not found. It was not found. The thing wasn't.</p>
	</section>
</body>
</html>
FOUR_OH_FOUR

# set up methods # 

def parse url
  arr = url.split '?'
  path = arr[0]
  query = arr[1]

  params = {}
  params[:path] = path

  if query.nil? 
  	params = {
  		path: path 
  	}
  else 
  	pairs = query.split '&'

  	key_values = []

  	pairs.each do |pair|
    	key_values.push(pair.split('='))
  	end

  	query_params = {}

  	key_values.each do |key_value|
    	query_params[key_value[0].to_sym] = key_value[1]
  	end

  	params = {
    	path: path,
    	query_params: query_params
  	}
  end 
  params
end


def search_for tag
	tag.delete! '+' # bug where for some reason this sign will return html 
	url = "https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=#{$access_token}"
	HTTParty.get url 
end 
 
  
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

# main loop # 

loop do 
	c = s.accept 

	r = c.gets
	r = r.split ' '
	r = r[1]
	r = parse r 

	if r[:path] == '/'

		f = File.read "./views/home/index.html"
		c.puts f 

	elsif r[:path] == "/see" 

		$search = r[:query_params][:things] 
		$images = search_for $search 
		$images = transform $images unless $images.nil? 
		$images = $images[0,9] unless $images.nil? 

		f = File.read "./views/results/index.html.erb"
		e = ERB.new f 
		v = e.result binding 

		c.puts v 

	elsif r[:path] == "/styles"

		f = File.read "./stylesheets/styles.css" 
		c.puts f 

	else 

		c.puts fof # default case is a complete 404 page 

	end 

	c.close 
end 
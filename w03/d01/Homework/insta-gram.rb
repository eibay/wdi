require 'pry'
require 'Httparty'
require 'socket'

server = TCPServer.new 2000
#port 2000 of server is open

# equivalent to while true
def parse_url(url)
  path = url.split("?")[0]
  #splits before and after '?' [0] indicating the first element of array

  query_string = url.split("?")[1]
  # query_string = the [1] second element of the array
  params = {}
  # params = empty hash
  params[:path] = path
  # :path = first element of array

  if query_string == nil
  #
    return params
  end

  pairs = query_string.split("&")

  key_values = []

  pairs.each do |pair|
    key_values.push(pair.split("="))
  end

  query_params = {}

  key_values.each do |key_value|
    query_params[key_value[0].to_sym] = key_value[1]
  end

  params[:query_params] = query_params #specific_tag

  return params
end

loop do

  client = server.accept
  #the server waits until browser sends a request
  request = client.gets
  #the request looks like GET /path+search_term HTTP1.1
  url = request.split(" ")[1]
  params = parse_url(url)

  if params[:path] == "/"
    html = File.read('insta-index.html')
    client.puts(html)
  elsif params[:path] == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif params[:path] == "/tag"
    tag = params[:query_params][:specific_tag]
    response_instagram_api = HTTParty.get("https://api.instagram.com/v1/tags/#{specific_tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")
    



    tags = []










	else
		client.puts "error"

  end  
    
    


    
    
  
  #   end

  #   html = html.gsub('{{movies}}', movies.join(''))

  #   client.puts(html)
  # else
  #   html = File.read('./views/404.html')
  #   client.puts(html)
  # end

  client.close

end
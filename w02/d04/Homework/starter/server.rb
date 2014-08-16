require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept
  client_ip = client.remote_address.ip_address
  puts "#{Time.now} - Client has connected from #{client_ip}"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "#{Time.now} - #{client_ip} is attempting to reach #{path}"

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)

  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)

  elsif path.split("/")[1] == "words"
    key_word = path.split("/")[2]

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{key_word}"

    puts "#{Time.now} - Connecting to OMBD"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMBD"

    li_keyword_results = File.read("./views/keyword_results.html")
    html_results_page = File.read("./views/result_page.html")
    keyword_result = []

    parsed_response["Search"].each do |result|
    keyword_result << li_keyword_results.gsub("{{title}}", result["Title"]).gsub("{{link}}", result["imdbID"]).gsub("{{year}}", result["Year"])
    end

    client.puts html_results_page.gsub("{{Keyword}}", key_word).gsub("{{keyword_result}}", keyword_result.join(''))
    puts "#{Time.now} - Sent search results to client #{client_ip}"
  
  else
    html = File.read('./views/404.html')
    client.puts(html)
  
  end

  client.close

end
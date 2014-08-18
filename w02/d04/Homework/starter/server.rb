require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

loop do

  client = server.accept
  client_ip = client.remote_address.ip_address

  puts "#{Time.now} - Client has connected from #{client_ip}"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

  
  if path == "/"
    html = File.read('./views/index.html')
    wordArr = ["friend", "true", "monkey", "nerds", "police"]
    wordArrList = []
     wordArr.each{|x| wordArrList<<"<li><a href='/words/" + x + "'>" + x + "</a></li>" }
    
    wordArrList = wordArrList.join('')
    html = html.gsub('{{list}}', wordArrList)
    client.puts(html)

  elsif path.split('/')[1] == "words"
    search = path.split('/')[2]
    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{search}"

    puts "#{Time.now} - Connecting to OMBD"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMBD"

    puts "#{Time.now} - Sent search info to client #{client_ip}"

    # searchArr = []
    # parsed_response["Search"].each do
    #   |x| searchArr << x 
    # end
    
    titleArr = []
    parsed_response["Search"].each do |x| titleArr<<"<li>#{(x["Title"])} was released in #{(x["Year"])}. <a href='http://www.imdb.com/title/#{(x["imdbID"])}/'>Click here for more info</a></li>"
    end
    list = titleArr.join('')
    html = File.read('./views/search_results.html')
    html2 = "<h1>Search results for #{search} on the OMDB</h1>"
    html2 += "<ul>"
    html2 += list
    html2 += "</ul>"
    html = html.gsub('{{Search_term}}', "#{search}").gsub('{{html}}', html2)
    client.puts html

  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)

  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end
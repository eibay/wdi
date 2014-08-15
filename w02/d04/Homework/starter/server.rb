require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 4000

# equivalent to while true
while true
  client = server.accept

  request = client.gets.chomp
  path = request.split(' ')[1]
  word = path.split('/')[2]


  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif path == "/words/#{word}"
    html = File.read('./word1.html')
    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{word}"

    

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)
    

     html = html.gsub('{{word}}', "#{word}")
     client.puts html


     movies =[]
     binding.pry
     
      index = 0
      while index < parsed_response["Search"].length
        title = parsed_response["Search"][b]["Title"] 
        year = parsed_response["Search"][b]["Year"]
        imdbID = parsed_response["Search"][b]["imdbID"]
        movies.push(title + year + imdbID) 
         b += 1
      end

    html2 = File.read('./word.html')
    html2 = html.gsub('{{title}}', parsed_response["Search"][b]["Title"] )
    html2 = html.gsub('{{year}}', year)
    html2 = html.gsub('{{imdbID}}', imdbID)
    client.puts(html2)
    
     
    # html2 = File.read('./word.html')
    # html2 = html.gsub('{{title}}', parsed_response["Search"][b]["Title"] )
    # html2 = html.gsub('{{year}}', year)
    # html2 = html.gsub('{{imdbID}}', imdbID)
    # client.puts(html2)

  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end
require 'socket'
require 'pry'
require 'json'
require 'uri'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept
  client_ip = client.remote_address.ip_address

  puts "#{Time.now} - Client has connected from #{client_ip}"

  request = client.gets.chomp
  path = request.split(' ')[1]
  path_first = path.split('/')
  path_second = path.split('/')[1]
  puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif path_second == "words" && path_first.length == 3
    movie_title = path.split('/')[2]
    
    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    # binding.pry
    omdb_api.puts "GET /?s=#{movie_title}"

    puts "#{Time.now} - Connecting to OMBD"

    a = omdb_api.gets.chomp #<-- put "a" instead of json_response because it didnt work.
    b = JSON.parse(a) #<-- put "b" instead of parsed_response because it didnt work.

      i = 0
      titles = []
      years = []
      imdbIDs = []

      while i < b["Search"].length
        titles << b["Search"][i]["Title"]
        years << b["Search"][i]["Year"]
        imdbIDs << b["Search"][i]["imdbID"]
        i += 1
      end

      n = 0
      # movie = {}
      # movies_titles = []
      # movies_years = []
      # movies_imdbIDs = []
      movies = []

      while n < 10
        titles[n]
        movies << "<h2><a href='http://www.omdbapi.com/?i=&t=#{URI.decode(titles[n])}'>#{titles[n]}</a></h2><li>Year:&nbsp&nbsp&nbsp&nbsp#{years[n]}<br>imdbIDs:&nbsp&nbsp&nbsp&nbsp#{imdbIDs[n]}</li>"
        # movies_years << "#{years[n]}"
        # movies_imdbIDs << "#{imdbIDs[n]}"
        n += 1
      end

      movie = movies.join(' ')
      # each_title = movies_titles.join('')
      # each_year = movies_years.join('')
      # each_imdbID = movies_imdbIDs.join('')
      # binding.pry

      # each.b["Search"] { |something|
      #   movie = something
      #   title = movie["Title"]
      #   Year = movie["Year"]
      #   imdbID = movie["imdbID"]
      # }

      ##I got an error when I used each statement.##

    html = File.read('./views/movies.html')
    # titles.each { |title|
    #     html += html.gsub("{{title}}", title)
    #   }
    # years.each { |year|
    #     html += html.gsub("{{year}}", year)
    # }
    
    # html = html.gsub("{{imdbID}}", movie[:imdbID])

    m = 0

    # while m < movies.length
      html = html.gsub("{{keyword}}", movie_title)
      html = html.gsub("{{title}}", movie)
      # html = html.gsub("{{year}}", each_year)
      # html = html.gsub("{{imdbID}}", each_imdbID)
    #   m += 1
    # end
    # binding.pry

    client.puts(html)
    # binding.pry

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMBD"
    puts "#{Time.now} - Sent movie info to client #{client_ip}"
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end
  client.close

end
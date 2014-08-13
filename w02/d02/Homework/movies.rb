require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2001

movie_db = [
  {
      name:"The Shawshank Redemption",
      rating:"9.2",
      rank:"1",
      link:"http://www.imdb.com/title/tt0111161/",
      year:"1994"
   },
   {
      name:"The Godfather",
      rating:"9.2",
      rank:"2",
      link:"http://www.imdb.com/title/tt0068646/",
      year:"1972"
   },
   {
      name:"The Godfather: Part II",
      rating:"9.0",
      rank:"3",
      link:"http://www.imdb.com/title/tt0071562/",
      year:"1974"
   },
   {
      name:"Pulp Fiction",
      rating:"8.9",
      rank:"4",
      link:"http://www.imdb.com/title/tt0110912/",
      year:"1994"
   },
   {
      name:"The Good, the Bad and the Ugly",
      rating:"8.9",
      rank:"5",
      link:"http://www.imdb.com/title/tt0060196/",
      year:"1966"
   },
   {
      name:"The Dark Knight",
      rating:"8.9",
      rank:"6",
      link:"http://www.imdb.com/title/tt0468569/",
      year:"2008"
   },
]

while true
  # connect
  client = server.accept
  client_ip = client.remote_address.ip_address

  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]
  # name = URI.decode(path.split('/')[2])
  puts "Client said: #{request}"

  # talk
  if path == "/" 
    html = "<h1>Movie list<h1>"
    i = 0
    while i < movie_db.length
      html += "<h2>#{movie_db[i][:name]}</h2>"
      i += 1
    end
    client.puts html
  # elsif path == "/movie/#{movie_db[i][:name]}"
  #   client.puts "Hey"
    else
      client.puts "Hi"
  end

  # disconnect
  client.close
end
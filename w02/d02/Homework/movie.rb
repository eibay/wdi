require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2001

movie_path_names = []

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

title_array = []
a = 0

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

  while a < movie_db.length
    title_array << movie_db[a][:name].downcase
    a += 1
  end

def movie_path(n)
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
  movie_name = movie_db[n][:name]
  path_name = movie_name[0..movie_name.length].downcase.gsub(" ", "%20")    
  return path_name
end

while true
  # connect
  client = server.accept
  client_ip = client.remote_address.ip_address

  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]

  puts "Client said: #{path}"

  name_path = path.split("/")[2]

  # talk
  if path == "/"
    html = "<h1>Movie list<h1>"
    i = 0

    while i < movie_db.length
      html += "<ol><li><a href="'/'+'movies'+'/'+"#{movie_path(i)}"">#{movie_db[i][:name]}</a></li></ol>"
      movie_path_names << movie_path(i)
      i += 1
    end

    client.puts html


    elsif path == "/movies/#{name_path}"
      name_path = name_path.gsub("%20", " ")

      if title_array.include?(name_path)
        html =  "<h1>Movie title: #{name_path}</h1>"
        html += "<p>Rating: #{movie_db[i][:rating]}</p>"
        html += "<p>Rank: #{movie_db[i][:rank]}</p>"
        html += "<p>Link: #{movie_db[i][:link]}</p>"
        html += "<p>Year: #{movie_db[i][:year]}</p>"
      else
        client.puts "NOT FOUND"
      end
    else
      client.puts "NOT FOUND"   
  end
  # disconnect
    client.close
end




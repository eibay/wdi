
require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2000



movie_db = [
  {
      name:"The Shawshank Redemption",
      rating:"9.2",
      rank:1,
      link:"http://www.imdb.com/title/tt0111161/",
      year:"1994"
   },
   {
      name:"The Godfather",
      rating:"9.2",
      rank:2,
      link:"http://www.imdb.com/title/tt0068646/",
      year:"1972"
   },
   {
      name:"The Godfather: Part II",
      rating:"9.0",
      rank:3,
      link:"http://www.imdb.com/title/tt0071562/",
      year:"1974"
   },
   {
      name:"Pulp Fiction",
      rating:"8.9",
      rank:4,
      link:"http://www.imdb.com/title/tt0110912/",
      year:"1994"
   },
   {
      name:"The Good, the Bad and the Ugly",
      rating:"8.9",
      rank:5,
      link:"http://www.imdb.com/title/tt0060196/",
      year:"1966"
   },
   {
      name:"The Dark Knight",
      rating:"8.9",
      rank:6,
      link:"http://www.imdb.com/title/tt0468569/",
      year:"2008"
   },
]

def page_html(page , client , server)

client.puts "<html><body><ol><li>Name:#{page[:name]}</li><li>Rating:#{page[:rating]}</li>
<li>Year of Release:#{page[:year]}</li>
<li><a href='#{page[:link]}''>Imdb Link</a></li></ol><a href='/movies'>'Return to movie list</a></body></html>"

end
while true
  # connect
  client = server.accept
 
  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]


   if(path=="/movies")
     
      i=0
      client.puts"<html><body><ol>"
      while (i < movie_db.length)
         client.puts"<li><a href='/movies/#{movie_db[i][:name]}'>#{movie_db[i][:name]}"
         i+=1
      end
      client.puts"</ol></body></html>"
      puts"Client connected from path #{path}"
   
   elsif (path.split('/')[1]=="movies")&&(path.split('/').length == 3)

      name = URI.decode(path.split('/')[2])
       find=movie_db.find {|x| x[:name] == name}
       index=movie_db.index(find)
      page_html(movie_db[index], client, server)
         puts "Client connected"
      
   end
   client.close
end




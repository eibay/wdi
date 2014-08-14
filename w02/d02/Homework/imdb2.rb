require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2000

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

def hexcode  
 hexarray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
 colorarray = []
 textcolorarray = []
6.times { hexcolor = rand(15)

colorarray.push(hexarray[hexcolor]) }
colorreal = "#" + colorarray[0] + colorarray[1] + colorarray[2] + colorarray[3] + colorarray[4] + colorarray[5]
return colorreal
end


while true
  # connect
  client = server.accept

  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]
  puts "Client said: #{request}"
puts path

   # talk
#if path == "/movies"
  index = 0
   movArr = []
 
   while index < movie_db.length
      movArr << "#{movie_db[index][:name]}"
      
      index += 1
   end
if path == "/movies"
  hex1 = hexcode
   client.puts"<!doctype html><head><link href='http://fonts.googleapis.com/css?family=Limelight|Cutive' rel='stylesheet' type='text/css'><title>It's the top 6 movies!</title></head>
<body style='font-family: Tacoma; background-color: #{hex1}; color: #CEF09D; font-size: 18px'>
<div style='padding: 12px; background-color: #476C5E; border: dotted 8px #CEF09D; border-radius: 20px'><ol>"
   looper = 0
   while looper < 6
      client.puts"<li><a style='font-family: Limelight, cursive' href='/movies/#{movArr[looper]}/'>#{movArr[looper]}</a></li>"

      looper += 1
   end

client.puts"</ol>"

elsif path.split('/')[1] == "movies" && path.split('/').length == 3
   name = URI.decode(path.split('/')[2])
   name2 = path.split('/')[2]
   #client.puts "<!doctype html>"
hex = hexcode
rating1 = "#{movie_db[movArr.index(name)][:rating]}"
rank1 = "#{movie_db[movArr.index(name)][:rank]}"
link1 = "#{movie_db[movArr.index(name)][:link]}"
year1 = "#{movie_db[movArr.index(name)][:year]}"
client.puts "
<head><link href='http://fonts.googleapis.com/css?family=Limelight|Cutive' rel='stylesheet' type='text/css'><title>All About #{name}</title></head>
<body style='font-family: Tacoma; background-color: #{hex}; color: #CEF09D; font-size: 18px'>
<div style='padding: 12px; background-color: #476C5E; border: dotted 8px #CEF09D; border-radius: 20px'>
<h1 style='text-align: center; font-family: limelight, cursive'>
#{name}</h1></div>"

client.puts "<div style='margin: 15px'></div>
<div style='padding: 18px; background-color: #476C5E; border: dotted 8px #CEF09D; border-radius: 20px'>
<p style='font-family: Cutive, serif'>#{name} is ranked number #{rank1} on the IMDB top 250 with a rating of #{rating1}.  It came out all the way back in #{year1}. For more information click 
<a href='#{link1}'>here.</a></p></div>"

end
client.close
end






require 'socket'

server = TCPServer.new 2000

# / -> Index h1
# /hello -> Hello! h1

while true
  # connect
  client = server.accept

  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]
  puts "Client said: #{request}"
  t=Time.new
    time = t.strftime("%I:%M %p")
  # talk
  if path == "/hello "
    client.puts "<h1>HELLO!</h1>"
  elsif path == "/"
    
    client.puts '<body style="background-color: green; color: white"><h1>index <span style="color: red">#{time}</span></h1></body>'
  elsif request.include?('/hello/')
    name = request.split("/")[2]
    name2 = name.split(" ")[0].capitalize
people = {
  "monkey" => {
    location: "tree",
    flavor: "banana"
  },
  "severus" => {
    location: "wizard death place with dumbledore",
    flavor: "coffee"
  },
  "peter parker" => {
    location: "Forest Hills",
    flavor: "fly"
  }
}


def hexcode  
 hexarray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
 colorarray = []
 textcolorarray = []
6.times { hexcolor = rand(15)

colorarray.push(hexarray[hexcolor]) }
colorreal = "#" + colorarray[0] + colorarray[1] + colorarray[2] + colorarray[3] + colorarray[4] + colorarray[5]
return colorreal
end

col1 = hexcode
colorreal2 = hexcode
if people.keys.include?(name)

    client.puts "<body style='text-align: center; background-color: #{col1}; color: white'><h1 style='color: #{colorreal2}'>Hello, #{name2}!</h1><p>side note: It's #{time}!</p></body>"
  else
    client.puts "<body style='text-align: center; background-color: #{col1}; color: white'><h1 style='color: #{colorreal2}'><span style='font-size: 72px'>WOAH,</span> we do not know you!</h1><p>side note: It's #{time}!</p></body>"
 
  end
  end
  

  client.close
end
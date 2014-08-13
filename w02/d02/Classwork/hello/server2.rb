require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2000

# / -> Index h1
# /hello -> Hello! h1
# /hello/acceptablenames -> <h1>Hello, Name!</h1>
# monkey, severus, peter parker
# Woah - we do not know you.

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

while true
  # connect
  client = server.accept

  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]
  puts "Client said: #{request}"

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
col3 = hexcode




  # talk
  if path == "/hello"
    current_time = Time.now.strftime("%I:%M%P")
    client.puts "<h1>HELLO! #{current_time}</h1>"
  elsif path == "/"
    client.puts "<h1>index</h1>"
  elsif path.split('/')[1] == "hello" && path.split('/').length == 3
    name = URI.decode(path.split('/')[2])
    if people.keys.include?(name)
      html = "<head><link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'></head><body style='background-color: #{colorreal2}'><h1 style='color: #{col1}'>Hello, #{name.capitalize}</h1>"
      html += "<div style='margin: 50px; border: #{col1} dashed 6px;'><p style='font-family: Montserrat, sans-serif; color: #{col3}; font-size: 32px; margin: 50px; border: #{col1} dashed 6px; border-radius: 10px; padding: 10px'>Who lives in #{people[name][:location]}</p>"
      html += "<p style='color: #{col3}; font-size: 32px'>I bet you just <strong>looooove</strong> #{people[name][:flavor]}</div>"
      client.puts html
    else
      client.puts "<h1>WOAH! We don't know you...</h1>"
    end
  else
    client.puts "NOT FOUND"
  end

  # disconnect
  client.close
end
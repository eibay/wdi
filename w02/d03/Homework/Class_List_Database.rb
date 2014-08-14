##Week2-Day03

# - **Goal**: To continue exploring how to use templates to dynamically generate our html
# - **Spec**:
#   - Create a TCP server in Ruby
#   - There should be a route to `/` that displays a list of all the students in our class
#   - If you click on a students name, you should be shown Github information about that student
#     - Use the provided data to fill in this information
#       - Include login, created_at, html_url, public_repos and avatar image
#   - You **must** use templates and `.gsub` to limit the amount of html pages that you have to create

# - **Things to Consider**:
#   - It is a really good idea to initially start with creating a template to view the Github information of just one student.
#   - Once you have a good idea of how that is working, you can build the rest of the assignment around it
# - **Data**:
#   - [Student Github Hash](https://gist.github.com/jkonowitch/67d63351948f838b089d)
#   - Follow the link and copy the entire hash into your Ruby file
# - **Bonus**
#   - Add stylesheets
#   - Use RUBY to add your stylesheets to the `<head>` of your html. (ie, can you not type the `<link>` tag into every html file)


require 'socket'
# require 'uri'
require 'pry'

class_data = [
  {
    "login"=>"theerickramer",
    "html_url"=>"https://github.com/theerickramer",
    "created_at"=>"2014-07-08T17:02:08Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8105300?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"adrianmlin",
    "html_url"=>"https://github.com/adrianmlin",
    "created_at"=>"2014-03-20T18:06:11Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/7014171?v=2",
    "public_repos"=>6
  },
  {
    "login"=>"Nastassia",
    "html_url"=>"https://github.com/Nastassia",
    "created_at"=>"2011-03-24T21:51:54Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/689206?v=2",
    "public_repos"=>10
  },
  {
    "login"=>"JBiggs91",
    "html_url"=>"https://github.com/JBiggs91",
    "created_at"=>"2014-05-01T21:01:12Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/7461951?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"trishfromtisch",
    "html_url"=>"https://github.com/trishfromtisch",
    "created_at"=>"2014-07-26T16:14:53Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8276190?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"jortenberg",
    "html_url"=>"https://github.com/jortenberg",
    "created_at"=>"2014-07-24T22:24:25Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8261821?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"lisajwells",
    "html_url"=>"https://github.com/lisajwells",
    "created_at"=>"2014-07-14T19:17:45Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8161686?v=2",
    "public_repos"=>2
  },
  {
    "login"=>"gemsandjava",
    "html_url"=>"https://github.com/gemsandjava",
    "created_at"=>"2014-07-11T22:37:37Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8139449?v=2",
    "public_repos"=>2
  },
  {
    "login"=>"crawfordforbes",
    "html_url"=>"https://github.com/crawfordforbes",
    "created_at"=>"2014-01-31T17:51:18Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/6555939?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"TimoorKurdi",
    "html_url"=>"https://github.com/TimoorKurdi",
    "created_at"=>"2014-05-30T18:31:24Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/7749386?v=2",
    "public_repos"=>2
  },
  {
    "login"=>"neener",
    "html_url"=>"https://github.com/neener",
    "created_at"=>"2014-02-13T17:26:16Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/6674492?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"tdshap",
    "html_url"=>"https://github.com/tdshap",
    "created_at"=>"2014-06-26T14:13:00Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/7996806?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"jeffcampomanes",
    "html_url"=>"https://github.com/jeffcampomanes",
    "created_at"=>"2014-07-15T14:02:11Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8169976?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"brendee",
    "html_url"=>"https://github.com/brendee",
    "created_at"=>"2014-03-06T15:41:33Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/6874416?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"clay-reed-a",
    "html_url"=>"https://github.com/clay-reed-a",
    "created_at"=>"2013-09-10T01:40:40Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/5423195?v=2",
    "public_repos"=>12
  },
  {
    "login"=>"conorhastings",
    "html_url"=>"https://github.com/conorhastings",
    "created_at"=>"2014-07-25T02:48:09Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8263298?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"yoshiemuranaka",
    "html_url"=>"https://github.com/yoshiemuranaka",
    "created_at"=>"2014-07-08T02:08:21Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8097306?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"DanielFarber",
    "html_url"=>"https://github.com/DanielFarber",
    "created_at"=>"2014-07-09T05:16:47Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8110109?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"shotarokamegai",
    "html_url"=>"https://github.com/shotarokamegai",
    "created_at"=>"2014-04-11T09:10:34Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/7261534?v=2",
    "public_repos"=>2
  },
  {
    "login"=>"wuuk",
    "html_url"=>"https://github.com/wuuk",
    "created_at"=>"2014-07-24T16:16:55Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8259036?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"im11041991",
    "html_url"=>"https://github.com/im11041991",
    "created_at"=>"2014-07-24T14:01:48Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8257713?v=2",
    "public_repos"=>0
  },
  {
    "login"=>"HeidiW",
    "html_url"=>"https://github.com/HeidiW",
    "created_at"=>"2014-04-03T02:11:29Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/7145267?v=2",
    "public_repos"=>2
  },
  {
    "login"=>"pateltejal9500",
    "html_url"=>"https://github.com/pateltejal9500",
    "created_at"=>"2014-07-09T20:15:56Z",
    "avatar_url"=>"https://avatars.githubusercontent.com/u/8117970?v=2",
    "public_repos"=>0
  }
]

#to test
# class_data = [{
#     "login"=>"HeidiW",
#     "html_url"=>"https://github.com/HeidiW",
#     "created_at"=>"2014-04-03T02:11:29Z",
#     "avatar_url"=>"https://avatars.githubusercontent.com/u/7145267?v=2",
#     "public_repos"=>2
#   },
#   {
#     "login"=>"pateltejal9500",
#     "html_url"=>"https://github.com/pateltejal9500",
#     "created_at"=>"2014-07-09T20:15:56Z",
#     "avatar_url"=>"https://avatars.githubusercontent.com/u/8117970?v=2",
#     "public_repos"=>0
#   }
# ]


#titles = []
all_students_for_index = []

# i = 0
# while i < movie_db.length
#   movie = movie_db[i]
#   titles.push("<li><a href='/movies/#{URI.encode(movie[:name])}'>#{movie[:name]}</a></li>")
#   i += 1
# end

i = 0
while i < class_data.length
  person = class_data[i] #this is to access the hash that is that person's record
  all_students_for_index.push("<li><a href='/#{person["login"]}'>#{person["login"]}</a></li>")
  i += 1
end

server = TCPServer.new 2000

while true
  client = server.accept
  puts "Client connected"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "Requesting #{path}"


    if path == '/' #means if the path == root
      html = File.read('./views/student_index.html') #this tells it what file to read and stores it to variable 'html'
      puts "Sent 'student_index.html' to viewer." #we sent this to the client 
      #try it first without this, then see if it works


      html = html.gsub("{{stylesheet}}", "<link rel='stylesheet' type='text/css' href='../stylesheets/style.css'>")
#see if this is correct path for the stylesheet to be read


      html = html.gsub('{{students}}', all_students_for_index.join(''))
            # array.join(''))
            # .join joins all the elements in the array into a string
            # item in the () tells you what to separate the values with
            # here they will be separated with a space
      client.puts(html)

#do i need to add this here? or does it work above
#i needed 

    elsif path == '/stylesheets/style.css' 
      html = File.read('./stylesheets/style.css') 


#HOW TO CHECK WHAT 'REQUEST' IS HERE?
# request = "GET /movies HTTP/1.1"
# path = request.split(" ")[1]
# path = "/movies"
# path.split("/")[1] = movies 
#our path.split("/")[1] = the login name
# from browser http://127.0.0.1:2000/theerickramer


    #elsif path.split("/")[1] == "movies" 
    #this split might not work if first path we're looking for is '/'

    elsif path.split("/").length == 2
  
      login_name = path.split('/')[1]
      # to find login name match in array

      i = 0
      while i < class_data.length
          if class_data[i]["login"] == login_name
            login_name = class_data[i] 
          end
      i += 1
      end

#where this came from - but now i don't get the logic of it? 
#if it ==, then we assign it to the value that it's equal to?

# i = 0
#     while i < movie_db.length
#       if movie_db[i][:name] == title
#         movie = movie_db[i] 
#       end

#       i += 1
#     end

      html = File.read('./views/student_details.html')

      html = html.gsub('{{user}}', login_name["login"])
      #ERROR
      #Class_List_Database.rb:300:in `gsub': no implicit conversion of nil into String (TypeError)
      html = html.gsub('{{html}}', login_name["html_url"])
      html = html.gsub('{{create_date}}', login_name["created_at"])
      html = html.gsub('{{link}}', login_name["public_repos"].to_s)
      html = html.gsub('{{avatar}}', login_name["avatar_url"])
      # html = html.gsub('{{link}}', login_name["public_repos"])
      #do we need to convert the integer value output as a string or leave as is

      client.puts(html)

    else 
      client.puts "Error"

  end

client.close
  puts "Client disconnected"

end

























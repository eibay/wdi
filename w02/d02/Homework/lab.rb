require 'socket'
require 'erb'

f = File.read './movies.db' # for the 10000000000000000 time 
eval f # forgot how to load a file 
# made own way 

s = TCPServer.new 2000 

loop do 

   client = s.accept 
   puts "Client connected!"

   request = client.gets.chomp 
   path = request.split(' ')[1]
   
   a = path.split '/'
   $movie_name = a[2]

   puts "\tThey want #{path}!"

   if path == "/movies"
      f = File.read "./views/movies/index.html.erb" 
      e = ERB.new f 
      v = e.result binding 
      client.puts v 
      puts "Sent them the movies view"

   elsif a[1] == "movies" && $movie_name
      $movie_db.each do |movie|
         if movie[:name] == $movie_name.gsub("%20", ' ')  
            f = File.read "./views/movie/index.html.erb" 
            e = ERB.new f 
            v = e.result binding 
            client.puts v 
            puts "Like, totally sent them a movie view"
         else 
            puts "Couldn't find what they wanted"
         end  
      end 

   else
      if File.exists? path
         if File.directory? path 
            client.puts File.read path + "/index.html"
         else
            client.puts File.read path 
         end 
      else 
         puts "Couldn't find what they wanted"
      end 
   end 

   client.close 
end 


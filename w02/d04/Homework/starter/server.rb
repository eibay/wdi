require 'socket'
require 'json'
require 'rainbow/ext/string'
require 'uri'
require 'csv'
server = TCPServer.new 2000

# equivalent to while true
def parsepath(url)
queryparams={}
parsedpath=url.split("?")
path=parsedpath[0]
parsedpath=parsedpath[1].split("&")
parsedpath.each do |n|
  variables=n.split("=")
  param=variables[0].to_sym
  value=variables[1]
  queryparams[param]=value
end
  params = {
    path: path,
    query_params: queryparams
  }
 return params

end

loop do




  client = server.accept
  client_ip=client.remote_address.ip_address
  puts "#{Time.now} has connected from #{client_ip}".color(:red)
  request = client.gets.chomp
  path = request.split(" ")[1]
  puts path
  puts "#{Time.now}: Client #{client_ip} is attempting to connect from #{path}".color(:green)
  # if(path.include? "?")
  #   params=parsepath(path)
  # end
   

  if path == "/"
    html = File.read('./views/index.html')
    i=0
    words=CSV.read("./MostFrequent1000.csv")
    puts words

    random_words=[]

    while (i < 20)
      word_array=words.sample
      word=word_array[0]
      words.delete(word_array)
      if(1 >= word.length)
        #do nothing
      else
      random_words.push("<li><a href='./words/?movie=#{word}'>#{word}</a></li>")
      i+=1
    end
  end
    client.puts html.gsub("{{random_words}}" , random_words.join(''))

  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif(path.split("/")[1]=="words")&&(path.include? "?")

        params=parsepath(path)

     
      api=TCPSocket.new 'www.omdbapi.com', 80
      api.puts "GET /?&s=#{params[:query_params][:movie]}"
      puts"#{Time.now} :Connecting to OMDB".color(:magenta)

      response=api.gets
      response=JSON.parse(response)

      html_file=File.read('./views/moviepage.html')
      movies=[]
      response["Search"].each do |n|
         
        movies.push("<li><a href='http://imdb.com/title/#{n['imdbID']}'>#{n['Title']}-#{n['Year']}</a></li>")


      end
      client.puts html_file.gsub("{{movie}}" , params[:query_params][:movie].capitalize).gsub("{{list_of_movies}}" , movies.join(''))

  else
    html = File.read('./views/404.html')
    client.puts(html)
    
  end

  client.close

end
require 'socket'
require 'webrick'
require 'httparty'
require 'pry'

server = TCPServer.new 2000

loop do
  client = server.accept
  request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
  request.parse(client)

  if request.path == "/" && request.request_method == "GET"
    html = File.read('./views/index.html')
    client.puts html
  elsif request.path == "/stylesheets/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts css
  elsif request.path == "/images"
    html = File.read("./views/images.html")
    query = request.body.split("=")[1]
    images = []
    tag = HTTParty.get("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")
    tag["data"].each do |pic|
      imgs = File.read("./views/img_results.html")
      results = imgs.gsub('{{image}}', pic["images"]["low_resolution"]["url"])
      images << results
    end

    html = html.gsub('{{query}}', query)
    html = html.gsub("{{images}}", images.join(" "))

    tags = []
    tags << query
    puts query
    #
    if request.path == "/tags" 
      binding.pry

      s_tags = []
      s_tags << query
      puts s_tags
      client.puts "Saved #{query}"
    end
    client.puts html
    #
    # if request.query == "/save_q"
    #   tags = []
    #   tags << query
    #   puts tags
    # end
  # elsif request.path == "/save"
  #   tags = []
  #   tags << query
  #   binding.pry
  #   client.puts "Saved #{query}"
  #   # html  = File.read("./views/images.html")
  #   html = html.gsub("{{images}}", images.join(" "))
  #   client.puts html
  end
    # binding.pry




  client.close
end

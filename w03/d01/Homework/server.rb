require 'socket'
require 'httparty'
require 'pry'
load 'parse_url.rb'

server = TCPServer.new 2000

  loop do
    client = server.accept
    request = client.gets

    path = request.split(' ')[1]
    params = parse_url(path)

    if params[:path] == "/"
      html = File.read('./views/index.html')
      client.puts(html)
    elsif params[:path] == "/styles.css"
      css = File.read('./stylesheets/styles.css')
      client.puts(css)
    elsif params[:path] == "/images"
      html = File.read('./views/images.html')
      query = params[:query_params][:query]
      tag = HTTParty.get("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")
      img = []
      tag["data"].each do |pic|
        html = File.read('./views/results.html')
        results = html.gsub('{{images}}', pic["images"]["low_resolution"]["url"])
        img << results
      end

      html = File.read('./views/images.html')
      html = html.gsub('{{query}}', query)
      html = html.gsub('{{images}}', img.join(" "))

      client.puts(html)
    end




    client.close
  end

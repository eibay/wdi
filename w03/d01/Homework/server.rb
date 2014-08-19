require "socket"
require "pry"
require "httparty"

server = TCPServer.new 2000

def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path

  if query_string == nil
    return params
  end

  pairs = query_string.split("&")

  key_values = []

  pairs.each do |pair|
    key_values.push(pair.split("="))
  end

  query_params = {}

  key_values.each do |key_value|
    query_params[key_value[0].to_sym] = key_value[1]
  end

  params[:query_params] = query_params

  return params
end


loop do 
	client = server.accept

	request = client.gets
	url = request.split(" ")[1]
	params = parse_url(url)
  array = []

	if params[:path] == "/"
		html = File.read('./views/index.html')
		client.puts(html)
	elsif params[:path] == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
	elsif params[:path] == "/tag"
		thing = params[:query_params][:search_word]
    html = File.read('./views/images.html')

    instagram_images = HTTParty.get("https://api.instagram.com/v1/tags/#{thing}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8", headers: {"User-Agent" => "Httparty"})

    instagram_images["data"].each do |image|
      array.push "<img src='" + image['images']['low_resolution']['url'] + "'/>"
    end

    fat_string = array.join('')

    image_page = html.gsub('{{search_word}}', thing)
    final_page = image_page.gsub('{{image}}', fat_string)

    client.puts(final_page)

  else
    html = File.read('./views/404.html')
    client.puts(html)
	
	end

	client.close

end





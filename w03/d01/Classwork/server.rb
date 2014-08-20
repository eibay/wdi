require 'socket'
require 'httparty'
require 'pry'

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

server=TCPServer.new 2000
loop do
	client=server.accept
	request=client.gets
	path = request.split(" ")[1]
	if(path=="/favicon.ico")
		puts "go away favicon"
 	elsif(path=="/")
 		client.puts File.read("./index.html")
 	elsif(path.split("/")[1]==="images")&&(path.include? "?")
 		params=parsepath(path)
 		if(params[:query_params][:city]=="New+York")
 			lat="40.750848"
 			long="-73.998086"
 			response=HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=8fe4db31e3a940068664c1e7e3c5c061&distance=5000")
 			client.puts "<html><body>"
 			images_array=[]
 			response["data"].each do |search|
 				
 				search["tags"].each do |tags|
 					puts tags
 					
 					if tags==params[:query_params][:tag_search]
 							puts tags
 							image_url=search["images"]["standard_resolution"]["url"]
						client.puts "<img src='#{image_url}' /><br />"
						images_array.push(image_url)
 							
 					end

 					
 				end
 				
 				
 			end
 			if(images_array.empty?)
 					client.puts "Found no images with that tag in this city"
 				end
 			client.puts "</body></html>"
 		elsif(params[:query_params][:city]=="Philadelphia")
 			lat="39.954091"
 			long="-75.168845"
 			response=HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=8fe4db31e3a940068664c1e7e3c5c061&distance=5000")
 			client.puts "<html><body>"
 			images_array=[]
 			response["data"].each do |search|
 				
 				search["tags"].each do |tags|
 					puts tags
 					
 					if tags==params[:query_params][:tag_search]
 							puts tags
 							image_url=search["images"]["standard_resolution"]["url"]
						client.puts "<img src='#{image_url}' /><br />"
						images_array.push(image_url)
 							
 					end
 					
 				end
 				
 				
 			end
 			if(images_array.empty?)
 					client.puts "Found no images with that tag in this city"
 				end
 			client.puts "</body></html>"
 		elsif(params[:query_params][:city]=="San+Francisco")
 			lat="37.773984"
 			long="-122.430390"
 			response=HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=8fe4db31e3a940068664c1e7e3c5c061&distance=5000")
 			client.puts "<html><body>"
 			images_array=[]
 			response["data"].each do |search|
 				
 				search["tags"].each do |tags|
 					puts tags
 					
 					if tags==params[:query_params][:tag_search]
 							puts tags
 							image_url=search["images"]["standard_resolution"]["url"]
							client.puts "<img src='#{image_url}' /><br />"
							images_array.push(image_url)

							
						
 								
 					end
 					
 				end
 				
 				
 			end
 			if(images_array.empty?)
 					client.puts "Found no images with that tag in this city"
 				end
 				client.puts "</body></html>"
 			elsif(params[:query_params][:city]=="own")
 			lat=params[:query_params][:lattitude]
 			long=params[:query_params][:longitude]
 			response=HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=8fe4db31e3a940068664c1e7e3c5c061&distance=5000")
 			client.puts "<html><body>"
 			images_array=[]
 			response["data"].each do |search|
 				
 				search["tags"].each do |tags|
 					puts tags
 					
 					if tags==params[:query_params][:tag_search]
 							puts tags
 							image_url=search["images"]["standard_resolution"]["url"]
							client.puts "<img src='#{image_url}' /><br />"
							images_array.push(image_url)

							
						
 								
 					end
 					
 				end
 				
 				
 			end
 			if(images_array.empty?)
 					client.puts "Found no images with that tag in this city, here are all of the most recent images from that city"

 				end
 				client.puts "</body></html>"
		else






 			response=HTTParty.get("https://api.instagram.com/v1/tags/#{params[:query_params][:tag_search]}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")
 				client.puts "<html><body>"
 			# puts response["data"][0]["images"]["standard_resolution"]["url"]
 			images_array=[]
 			response["data"].each do |tag|
 			puts tag["images"]["standard_resolution"]["url"]
 			image_url=tag["images"]["standard_resolution"]["url"]

 			client.puts "<img src='#{image_url}' /><br />"
 			end

			client.puts "</body></html>"
		end
	end
				client.close

end

# def parse_url(url)
#   path = url.split("?")[0]
#   query_string = url.split("?")[1]

#   params = {}
#   params[:path] = path

#   if query_string == nil
#     return params
#   end

#   pairs = query_string.split("&")

#   key_values = []

#   pairs.each do |pair|
#     key_values.push(pair.split("="))
#   end

#   query_params = {}

#   key_values.each do |key_value|
#     query_params[key_value[0].to_sym] = key_value[1]
#   end

#   params[:query_params] = query_params

#   return params
# end




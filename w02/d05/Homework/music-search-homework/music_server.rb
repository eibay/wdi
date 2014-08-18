require 'pry'
require 'json' #to decode the adi
require 'socket' #not sure why we need it still with httparty - to connect to the server 
# vs the socket - which httparty takes care of?
require 'httparty'#to get apis


server = TCPServer.new 2000

def parse_url(url) #taking the url and breaking it down to pieces to play with it
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

# not sure what this is for
ids = {}


loop do

  client = server.accept

  request = client.gets

  url = request.split(" ")[1]

  params = parse_url(url) #doing the method on the new url we got and setting the variable to url


if params[:path] == "/"
    front_page = File.read('./views/index.html')
    client.puts(front_page)

elsif params[:path] == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)

		 # looks like I could also combine the first two conditionals:

		 # if params[:path] == "/"
			# 	firstpage = File.read("./views/index.html")
			# 	firstpage = firstpage.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
			# 	client.puts firstpage


  elsif params[:path] == "/name"
  	# i think this really means if it's "/name" followed by the rest of the query (not just "/name" - confirm)

	# from old movie search server: word = params[:query_params][:specific_word]

	artistnamesearch = params[:query_params][:searchword]
	# this gets us the artist name searchword to give to the musicbrainz api using httparty. we did a string interpolation of the value into the response below
	 
	 #this gets the api from musicbrainz

	response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artistnamesearch}&fmt=json", headers: {"User-Agent" => "HTTParty"})

	 	# json_response = JSON.parse(response) 
	 	# classmate said dont need because already json
	 	# but this doesnt make sense! dont we need to convert it from json to ruby?
	 	#later also said - httparty already done json so no json.parse????
			

		# and dont need this either apparently
		# puts JSON.parse(json_response)

		# but maybe me trying to call both of these, if clasmate says i dont need to is what caused the string interpolation errors. ie - Maybe the responses were already translated to ruby even if they didnt look like it: 

		# {"created":"2014-08-17T08:15:31.01Z","count":3,"offset":0,"artist":[{"id":"e01646f2-2a04-450d-8bf2-0d993082e058","type":"Group","score":"100","name":"Phish","sort-name":"Phish","country":"US","area":{"id":"489ce91b-6658-3307-9877-795b68554c98","name":"United States","sort-name":"United States"},"begin-area":{"id":"453f5392-25d8-408e-b648-321b904e3439","name":"Burlington","sort-name":"Burlington"},"life-span":{"begin":"1983","ended":null},"tags":[{"count":1,"name":"rock"},{"count":1,"name":"jazz fusion"},{"count":1,"name":"jam"},{"count":1,"name":"progressive rock"},{"count":1,"name":"jazz"},{"count":1,"name":"american"}]},{"id":"d2a01429-82f5-4b25-9c06-db455af77fd5","type":"Person","score":"62","name":"Zen Phish","sort-name":"Zen Phish","gender":"male","country":"EE","area":{"id":"e1c1215f-dcc0-35b4-b840-d2ca2151593b","name":"Estonia","sort-name":"Estonia"},"life-span":{"ended":null}},{"id":"29adc2e8-46bf-4a91-8a1e-12491e3967fd","score":"37","name":"The Dude of Life and Phish","sort-name":"Dude of Life and Phish, The","life-span":{"ended":null}}]}


			# Movie server example 

			# html = File.read('./views/movies.html')
			#     html = html.gsub('{{search_word}}', word)

			# movies = []
			    
			#     parsed["Search"].each do |movie|
			#       individual_movie = File.read('./views/individual_movie.html')
			#       individual_movie = individual_movie.gsub('{{title}}', movie["Title"])
			#       individual_movie = individual_movie.gsub('{{year}}', movie["Year"])
			#       individual_movie = individual_movie.gsub('{{imdb_id}}', movie["imdbID"])
			#       movies.push(individual_movie)
			#     end

			#     html = html.gsub('{{movies}}', movies.join(''))


			#from classmate: take each artist name and link put it into empty array (but i want to put more info in it)

			# names = [] 

			# response["artist"].each do|x|
			# 		id = x["id"]
			# 		name = x["name"]
			# 		names << "<li> <a href='/name/#{id}'> #{name}</li>"
			# 		ids[x["id"]] = x["name"]
					
			# end	

			# html = File.read('./views/artist_index.html')

			# html = html.gsub("{{names}}", names.join('')) #give us a string of all artist names

			# but I want to add other html artist detail page stuff here vs. classmate example.


	html = File.read('./views/artist_index.html')
	    html = html.gsub('{{search_name}}', artistnamesearch)

	names = [] 
	#we're going to fill up this array with detail for each artist whos name matches the searched name


		response["artist"].each do|artist_record|

				# this is how im assigning variables but i think i can just do the html to read them out instead

				# 		id = artist_record["id"]
				# 		name = artist_record["name"]
				# 		country = artist_record["country"]
				# 		type = artist_record["type"]

				individual_artist = File.read('./views/individual_artist.html')
				individual_artist = individual_artist.gsub('{{artist_id}}', artist_record["id"])
				individual_artist = individual_artist.gsub('{{name}}', artist_record["name"])
				individual_artist = individual_artist.gsub('{{country}}', artist_record["country"])
				individual_artist = individual_artist.gsub('{{type}}', artist_record["type"])
					
				names.push(individual_artist)

		end

	html = html.gsub('{{names}}', names.join(''))

	# Question - re: the ordered list css here - can i just make sure i have this set in the individual artist
	# names << "<li> <a href='/name/#{id}'> #{name}</li>"
			

	# not sure why we need this css bit below from classmate example
	#i guess because we need to read the style sheet on this new page just like we did on the front page

	html = html.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')

# do i need to update the stylesheet path?

	client.puts(html)

	# does this version work too (from classmate example)?

	# client.puts html


			# I don't understand this part AT ALL from classmate example!

						# elsif params[:path].split("/")[2]#getting second part of word
						# 		specificartistid = params[:path].split("/")[2] 
						# 		 #getting id from hash of the artist
						# 		name = ids["#{specificartistid}"]
						# 		#getting artist name out using id
						# 		response = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{specificartistid}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})
						# 		#httparty already done json so no json.parse
						# 		country = response["country"]
						# 		type = response["type"]
								
								
						# 		#taking into account nil
								
						# 		if country == nil && type != nil
						# 			html1 = File.read("./views/index3.html")
						# 			html1 = html1.gsub("{{country}}", "sorry no information is available")
						# 			html1 = html1.gsub("{{type}}", type)
						# 			html1 = html1.gsub("{{artist}}", name)
						# 			html1 = html1.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
									

						# 		elsif type == nil && country != nil
						# 			html1 = File.read("./views/index3.html")
						# 			html1 = html1.gsub("{{country}}", country)
						# 			html1 = html1.gsub("{{type}}", "sorry no information is available")
						# 			html1 = html1.gsub("{{artist}}", name)
						# 			html1 = html1.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
									
									

						# 		elsif country == nil && type == nil
						# 			html1 = File.read("./views/index3.html")
						# 			html1 = html1.gsub("{{country}}", "sorry no information is available")
						# 			html1 = html1.gsub("{{type}}", "sorry no information is available")
						# 			html1 = html1.gsub("{{artist}}",name)
						# 			html1 = html1.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
									
									
						# 		else	
						# 			html1 = File.read("./views/index3.html")
						# 			html1 = html1.gsub("{{country}}", country)
						# 			html1 = html1.gsub("{{type}}", type)
						# 			html1 = html1.gsub("{{artist}}", name)
						# 			html1 = html1.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
									
						# 		end
						# 		client.puts html1


	  else
	    html = File.read('./views/404.html')
	    client.puts(html)
	  end


  client.close

  end
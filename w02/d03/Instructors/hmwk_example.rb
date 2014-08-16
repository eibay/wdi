require 'socket'
require 'pry'

student_db = [
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

server = TCPServer.new 2000

#lets create an array of just the logins
#from the student_db array of hashes

logins = []
i = 0
while i < student_db.length
	student_info = student_db[i]
	login = student_info["login"]
	logins << login

	i+=1
end

#we want a while true loop so that
#after we get a request from a browser and
#send a response we then start over and
#listen for a new request to come to us (the server)
#from the browser
while true
	#the server will wait at this line
	#until a browser sends a request to it
	#(waiting for the phone to ring)
	client = server.accept

	#pick up the phone and see what they want
	request_first_line = client.gets.chomp
	path = request_first_line.split(' ')[1]

	#print to the server log the path from the request
	puts path

	#this reponse string will be used to build up
	#our html line by line. we will finally
	#client.puts it at the end once it is all built up
	response = ""
	response += '<html><body>'

	if (path == "/")
		i = 0
		response += '<ol>'
		#output a link for each login
		while i < logins.length
			login = logins[i]
			template = "<li><a href='{{login}}'>{{login}}</a></li>"
			response += template.gsub('{{login}}', login)
			i+=1
		end
		response += "</ol>"
	elsif logins.include? path.split('/')[1]
		#on a specific students page

		#grab their login from the path variable
		login = path.split('/')[1]


		#first find the student info using the login
		i=0
		info = {}
		#loop through each students info
		while i< student_db.length
			#is this the student info with the
			#login that we are looking for?


#######
#I DONT UNDERSTAND WHY WE DO THE IF LOOP BELOW IF WE HAVE THE ELSIF LOOP ABOVE
#OH BECAUSE THAT FIRST ELSIF LOOP JUST GIVES US A NAME TO CALL THE BROWSER PATH
#SECOND LOOP LETS US SEE IF THAT PATH ACTUALLY MATCHES THE NAME OF AN ITEM IN OUR 
#HASH

			if student_db[i]["login"] == login
				#yes it is! lets grab the hash corresponding to this student
				info = student_db[i]
			end
			i+=1
		end
		#ok now that we are out of that while loop
		#the info hash should be properly set


		response += "<ol>"
		template = 
			"<li><a href='{{url}}'>{{login}}</a></li> \
			<li>{{created_at}}</li> \
			<li>{{repos}}</li> \
			<li><img src={{avatar}} /></li>"

		#one by one put in each value of the students info hash
		template = template.gsub("{{login}}", info["login"])
		template = template.gsub("{{created_at}}", info["created_at"])
		template = template.gsub("{{url}}", info["html_url"])
		template = template.gsub("{{repos}}", info["public_repos"].to_s)
		template = template.gsub("{{avatar}}", info["avatar_url"])
		
		#add that whole template that we just formed
		#to the reponse string that we have been building up
		response += template
		response += "</ol>"
	else
		response += "wat?"
	end

	response += '</body></html>'

	#send the response string back to the client
	client.puts response

	#close the connection (hang up the phone)
	client.close

	#this is the end of the while loop, after reaching this
	#the code will return to the line right after
	#while true and once again listen for a new connection
end



require 'socket'
require 'uri'
require 'pry'

server = TCPServer.new 2000

github_db = [
  {
    login:"theerickramer",
    html_url:"https://github.com/theerickramer",
    created_at:"2014-07-08T17:02:08Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8105300?v=2",
    public_repos:0
  },
  {
    login:"adrianmlin",
    html_url:"https://github.com/adrianmlin",
    created_at:"2014-03-20T18:06:11Z",
    avatar_url:"https://avatars.githubusercontent.com/u/7014171?v=2",
    public_repos:6
  },
  {
    login:"Nastassia",
    html_url:"https://github.com/Nastassia",
    created_at:"2011-03-24T21:51:54Z",
    avatar_url:"https://avatars.githubusercontent.com/u/689206?v=2",
    public_repos:10
  },
  {
    login:"JBiggs91",
    html_url:"https://github.com/JBiggs91",
    created_at:"2014-05-01T21:01:12Z",
    avatar_url:"https://avatars.githubusercontent.com/u/7461951?v=2",
    public_repos:0
  },
  {
    login:"trishfromtisch",
    html_url:"https://github.com/trishfromtisch",
    created_at:"2014-07-26T16:14:53Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8276190?v=2",
    public_repos:0
  },
  {
    login:"jortenberg",
    html_url:"https://github.com/jortenberg",
    created_at:"2014-07-24T22:24:25Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8261821?v=2",
    public_repos:0
  },
  {
    login:"lisajwells",
    html_url:"https://github.com/lisajwells",
    created_at:"2014-07-14T19:17:45Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8161686?v=2",
    public_repos:2
  },
  {
    login:"gemsandjava",
    html_url:"https://github.com/gemsandjava",
    created_at:"2014-07-11T22:37:37Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8139449?v=2",
    public_repos:2
  },
  {
    login:"crawfordforbes",
    html_url:"https://github.com/crawfordforbes",
    created_at:"2014-01-31T17:51:18Z",
    avatar_url:"https://avatars.githubusercontent.com/u/6555939?v=2",
    public_repos:0
  },
  {
    login:"TimoorKurdi",
    html_url:"https://github.com/TimoorKurdi",
    created_at:"2014-05-30T18:31:24Z",
    avatar_url:"https://avatars.githubusercontent.com/u/7749386?v=2",
    public_repos:2
  },
  {
    login:"neener",
    html_url:"https://github.com/neener",
    created_at:"2014-02-13T17:26:16Z",
    avatar_url:"https://avatars.githubusercontent.com/u/6674492?v=2",
    public_repos:0
  },
  {
    login:"tdshap",
    html_url:"https://github.com/tdshap",
    created_at:"2014-06-26T14:13:00Z",
    avatar_url:"https://avatars.githubusercontent.com/u/7996806?v=2",
    public_repos:0
  },
  {
    login:"jeffcampomanes",
    html_url:"https://github.com/jeffcampomanes",
    created_at:"2014-07-15T14:02:11Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8169976?v=2",
    public_repos:0
  },
  {
    login:"brendee",
    html_url:"https://github.com/brendee",
    created_at:"2014-03-06T15:41:33Z",
    avatar_url:"https://avatars.githubusercontent.com/u/6874416?v=2",
    public_repos:0
  },
  {
    login:"clay-reed-a",
    html_url:"https://github.com/clay-reed-a",
    created_at:"2013-09-10T01:40:40Z",
    avatar_url:"https://avatars.githubusercontent.com/u/5423195?v=2",
    public_repos:12
  },
  {
    login:"conorhastings",
    html_url:"https://github.com/conorhastings",
    created_at:"2014-07-25T02:48:09Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8263298?v=2",
    public_repos:0
  },
  {
    login:"yoshiemuranaka",
    html_url:"https://github.com/yoshiemuranaka",
    created_at:"2014-07-08T02:08:21Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8097306?v=2",
    public_repos:0
  },
  {
    login:"DanielFarber",
    html_url:"https://github.com/DanielFarber",
    created_at:"2014-07-09T05:16:47Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8110109?v=2",
    public_repos:0
  },
  {
    login:"shotarokamegai",
    html_url:"https://github.com/shotarokamegai",
    created_at:"2014-04-11T09:10:34Z",
    avatar_url:"https://avatars.githubusercontent.com/u/7261534?v=2",
    public_repos:2
  },
  {
    login:"wuuk",
    html_url:"https://github.com/wuuk",
    created_at:"2014-07-24T16:16:55Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8259036?v=2",
    public_repos:0
  },
  {
    login:"im11041991",
    html_url:"https://github.com/im11041991",
    created_at:"2014-07-24T14:01:48Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8257713?v=2",
    public_repos:0
  },
  {
    login:"HeidiW",
    html_url:"https://github.com/HeidiW",
    created_at:"2014-04-03T02:11:29Z",
    avatar_url:"https://avatars.githubusercontent.com/u/7145267?v=2",
    public_repos:2
  },
  {
    login:"pateltejal9500",
    html_url:"https://github.com/pateltejal9500",
    created_at:"2014-07-09T20:15:56Z",
    avatar_url:"https://avatars.githubusercontent.com/u/8117970?v=2",
    public_repos:0
  },
]


# Create a TCP server in Ruby
# There should be a route to / that displays a list of all the students in our class
# If you click on a students name, you should be shown Github information about that student
# Use the provided data to fill in this information
# Include login, created_at, html_url, public_repos and avatar image
# You must use templates and .gsub to limit the amount of html pages that you have to create


roster = []

x = 0

while x < github_db.length
	user = github_db[x]
		# roster.push("<li>#{user}</li>")

		# "<li><a href='/movies/#{URI.encode(movie[:name])}'>#{movie[:name]}</a></li>"
		roster.push("<li><a href='/#{user[:login]}'>#{user[:login]}</a></li>")
		x += 1
end

while true

client = server.accept
puts "Client connected"

request = client.gets.chomp
path = request.split(' ')[1]
puts "Client said: #{request}"

	if path == "/"

	r = 0

		while r < roster.length
		index_html = File.read('./views/index.html')
		index_html = index_html.gsub('{{login}}', roster.join(''))

		r += 1

		end

	client.puts index_html 

# elsif path == "/stylesheets/styles.css"
# 	client.puts File.read('./stylesheets/styles.css')

	elsif path == request.split(' ')[1] && request.split(' ').length == 3
	url = request.split(' ')[1].gsub('/', '')


	z = 0
    while z < github_db.length
      if github_db[z][:login] == url
        user = github_db[z]
      end

      z += 1
    end

	profile_html = File.read('./views/profile.html')
	profile_html = profile_html.gsub('{{login}}', user[:login])
	profile_html = profile_html.gsub('{{url}}', user[:html_url])
	profile_html = profile_html.gsub('{{created}}', user[:created_at])
	profile_html = profile_html.gsub('{{avatar}}', user[:avatar_url])
	profile_html = profile_html.gsub('{{repos}}', user[:public_repos].to_s)
	
	client.puts profile_html

end

client.close
puts "Client disconnected"
end
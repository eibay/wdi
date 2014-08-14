require 'socket'
require 'uri'


students=[
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
server = TCPServer.new 2009

while true
  client = server.accept
  request = client.gets.chomp
  path = request.split(" ")[1]
        if(path=="/")
   puts "The client is attempting to connect from #{path}"
   i=0
   student_names=[]
   while (i < students.length)
    
        student_names.push("<li><a href='/#{students[i]['login']}'>#{students[i]['login']}</a></li>")
        i+=1
  end

    
  
  html_file=File.read("./students.html")
      client.puts html_file.gsub("{{student_names}}",  student_names.join('')).gsub("{{style}}" , "    <link rel='stylesheet' type='text/css' href='./style.css'>")
  elsif(path=="/style.css")
    css_file= File.read("./style.css")
    client.puts css_file
  elsif(path.split("/").length==2)
    name=path.split("/")[1]
    
    find=students.find {|x| x["login"] == name}
    index=students.index(find)
    index=index.to_i
    
    puts "The client is attempting to connect from #{path}"
    html_file=File.read("./individual_student.html")
    # client.puts html_file.gsub("{{avatar}}" , students[index]["avatar_url"])
    replacements = [["{{avatar}}", students[index]["avatar_url"]] , ["{{username}}", students[index]["login"]] , ["{{creation_date}}" , students[index]["created_at"]] , ["{{html_url}}" , students[index]["html_url"]] , ["{{repo}}" , students[index]["public_repos"].to_s] , ["{{style}}" , "    <link rel='stylesheet' type='text/css' href='./style.css'>"]]
    replacements.each  {|replacement| html_file.gsub!(replacement[0], replacement[1])} 
    client.puts html_file

  end
  
  client.close
end







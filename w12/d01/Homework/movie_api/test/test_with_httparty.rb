require 'httparty'
require 'awesome_print'

data = [
  [{
    fname: "Makiko",
    lname: "Watanabe",
    picture_url: "http://ia.media-imdb.com/images/M/MV5BMTY4MDAwNzYxMF5BMl5BanBnXkFtZTcwNjQxNDc3MQ@@._V1_SX214_CR0,0,214,317_AL_.jpg"
  },
  {
   character_name: "Kaori"
  }],
  [{
    fname: "Sakura", 
    lname: "Ando",
    picture_url: "https://static.eigapedia.com/person-image/sakura-ando.jpg"

  }, 
  {
    character_name: "Koike"
  }]
]

m = HTTParty.post 'http://localhost:3000/movies.json', 
:body => {title: "Love Exposure", 
  year: "2013", 
  poster_url: "http://content7.flixster.com/movie/11/15/93/11159353_800.jpg"}

ap m 

data.each do |subarray| 
  actor, role = subarray
  actor_json = HTTParty.post "http://localhost:3000/actors.json",
  :body => actor 
  ap actor_json 
  role[:actor_id] = actor_json["id"]
  role_json = HTTParty.post "http://localhost:3000/movies/#{m["id"]}/roles.json",
  :body => role 
  ap role_json
end 


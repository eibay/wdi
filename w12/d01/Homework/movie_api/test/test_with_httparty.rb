require 'httparty'

m = HTTParty.post 'http://localhost:3000/movies.json', 
:body => {title: "Love Exposure", 
  year: "2013", 
  poster_url: "http://content7.flixster.com/movie/11/15/93/11159353_800.jpg"}

a = HTTParty.post 'http://localhost:3000/actors.json',
  :body => {
    fname: "Makiko",
    lname: "Watanabe",
    picture_url: "http://ia.media-imdb.com/images/M/MV5BMTY4MDAwNzYxMF5BMl5BanBnXkFtZTcwNjQxNDc3MQ@@._V1_SX214_CR0,0,214,317_AL_.jpg"
  }

r = HTTParty.post 'http://localhost:3000/roles.json',
:body => {
  character_name: "Kaori",
  movie_id: m.id, 
  actor_id: a.id l
}
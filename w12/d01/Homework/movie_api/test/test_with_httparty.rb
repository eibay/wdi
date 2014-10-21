require 'httparty'

HTTParty.post 'http://localhost:3000/movies.json', 
:body => {title: "Love Exposure", 
  year: "2013", 
  poster_url: "http://content7.flixster.com/movie/11/15/93/11159353_800.jpg"}) 
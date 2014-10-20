class MoviesController < ApplicationController

  #HTTParty.get('http://localhost:3000/movies.json')
  def index
    movies = Movie.all

    # prolly a better way to do this but for now I'm just gonna #
    movies.each do |movie|
      movie["roles"] = Role.where movie_id: movie.id 
    end  

    respond_to do |format|
      format.json { render :json => movies }
    end
  end

  #Good input
  #HTTParty.post('http://localhost:3000/movies.json', :body => {title: "Love Exposure", year: "2013", poster_url: "http://content7.flixster.com/movie/11/15/93/11159353_800.jpg"})
  #Bad input
  #HTTParty.post('http://localhost:3000/movies.json', :body => {title: "Love Exposure"})  
  def create
    movie = Movie.new(
      title: params["title"], 
       year: params["year"], 
 poster_url: params["poster_url"]
 )

    respond_to do |format|
      format.json do
        if movie.valid?
          movie.save
          render :json => movie
        else
          render :json => movie.errors.messages.to_json
        end
      end
    end
  end

  #Good input
  #HTTParty.put('http://localhost:3000/superheros/1.json', :body => {year: "2008"})
  #Bad input
  #HTTParty.put('http://localhost:3000/superheros/1.json', :body => {title: "Love Exposure"})  
  def update
    movie = Movie.find_by_id params[:id] 
    movie.title = params["name"]
    movie.year = params["year"]
    movie.poster_url = params["poster_url"]

    respond_to do |format|
      format.json do
        if movie.valid?
          movie.save
          render :json => movie
        else
          render :json => movie.errors.messages.to_json
        end
      end
    end
  end

end
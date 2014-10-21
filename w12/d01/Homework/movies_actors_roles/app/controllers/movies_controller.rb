class MoviesController < ApplicationController
  def index
    movies = Movie.all
    respond_to do |format|
      format.json do 
        render :json => movies
      end
      format.html do
        render text: "movie"
      end
    end
end

# HTTParty.get("http://localhost:3000/movies.json") 

def create
movie = Movie.create(title: params["title"], year: params["year"], poster: params["poster"])
respond_to do |format|
  format.json do 
    render :json => movie 
  end
  end
end




# HTTParty.post("http://localhost:3000/movies.json", :body => {"title"=> "Tejal"})


def update
  movie = Movie.find(params[:id])
  newMovie = {title: params["title"], year: params["year"], poster: params["poster"]}
  movie.update(newMovie)
  respond_to do |format|
    format.json do
      render :json => movie
    end
  end
end

# HTTParty.put("http://localhost:3000/movies/1.json", :body =>{"title"=> "update"})


def destroy
  movies = Movie.all
  movie = Movie.find(params[:id])
  movie.destroy
    respond_to do |format|
    format.json do
      render :json => movies
    end
  end
end





end
class MoviesController < ApplicationController

  def index
    movies = Movie.all
    respond_to do |format|
    format.json { render :json => movies }
    end
  end

  def create
    add_movie = Movie.new(title: params["title"], year: params["year"], poster_url: params["poster_url"])

    respond_to do |format|
      format.json do
        if add_movie.valid?
          add_movie.save
          render :json => add_movie
        else
          render :json => add_movie.errors.messages.to_json
        end
      end
    end
 end

 def show
    show_movie = Movie.find(params[:id])
    respond_to do |format|
    format.json{render :json => show_movie}
    end
 end

 def update
    update_movie = Movie.find(params[:id])
    update_movie.title = params["title"]
    update_movie.year = params["year"]
    update_movie.poster_url = params["poster_url"]

 respond_to do |format|
      format.json do
        if add_movie.valid?
          add_movie.save
          render :json => add_movie
        else
          render :json => add_movie.errors.messages.to_json
        end
      end
    end
  end

  def destroy
    delete_movie = Movie.find(params[:id])
    delete_movie.destroy


    # redirect_to '/movies'
  end

 # HTTParty.delete('http://localhost:3000/movies/5') is how u would delete a movie with an id 5.

end


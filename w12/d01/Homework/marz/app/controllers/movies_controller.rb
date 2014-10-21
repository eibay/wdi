class MoviesController < ApplicationController
  def index
    movies = Movie.all
    respond_to do |format|
      format.json { render :json => movies}
    end
  end

  def create
    movie = Movie.all
    Movie.create(title: params[:title], year: params[:year], poster_url: params[:poster_url])

    respond_to do |format|
      format.json { render :json => movie}
    end
  end

  def update
    movies = Movie.all

    movie = Movie.find(params[:id])
    movie.update(title: params[:title], year: params[:year], poster_url: params[:poster_url])

    respond_to do |format|
      format.json { render :json => movies }
    end
  end
end

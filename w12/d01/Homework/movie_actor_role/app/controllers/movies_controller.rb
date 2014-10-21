class MoviesController < ApplicationController

	def index
		@movies = Movie.all

		respond_to do |format|
			format.json { render :json => @movies }
		end
	end

	def create
		@movie = Movie.create({title: params[:title], year: params[:year], poster_url: params[:poster_url]})

		respond_to do |format|
			format.json {render :json => @movie }
		end
	end

	def show
		@movie = Movie.find( params[:id] )

		respond_to do |format|
			format.json { render :json => @movie, :include => [:actors, :roles] }
		end
	end

end
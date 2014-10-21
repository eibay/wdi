class MoviesController < ApplicationController


	def index
		@movies = Movie.all

		render json: @movies, :include => {:actors => {:include => :roles}}
	end

	def create
		@movie = Movie.create(year: params[:year], title: params[:title], poster_url: params[:poster_url])
		render json: @movie
	end

	def show
		@movie = Movie.find(params[:id])
		render json: @movie, :include => {:actors => {:include => :roles }}
	end

	def update
		@movie = Movie.update(year: params[:year], title: params[:title], poster_url: params[:poster_url])
		render json: @movie
	end

	def destroy
		Movie.find(params[:id]).destroy
		render json: {response: 'item deleted'}
	end



end






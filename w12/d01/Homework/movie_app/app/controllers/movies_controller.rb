class MoviesController < ApplicationController
	
	def index
		movies = Movie.all
		
		respond_to do |format|
			format.json {render :json => movies}
		end
	end

	def create
		movie = {title: params["title"],
		year: params["year"],
		poster_url: params["poster_url"]
		}
		Movie.create(movie)
		render :json => movie
	end

	def update
		movie = Movie.find(params["id"])
		movie.update({
			title: params["title"],
			year: params["year"],
			poster_url: params["poster_url"]
		})
		render :json => movie
	end

	def destroy
		movie = Movie.find(params["id"])
		movie.destroy
		render :json => movie	
	end
end


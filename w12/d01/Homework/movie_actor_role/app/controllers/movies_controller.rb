class MoviesController < ApplicationController
	def index
		movies = Movie.all

		respond_to do |format|
			format.json { render :json => movies }
		end
	end

	def create
		movie = Movie.create({title: params["title"], year: params["year"], poster_url: params["poster_url"]})
		respond_to do |format|
			format.json { render :json => movie }
		end
	end

	def update
		movie = Movie.find(params["id"])
		movie.title = params["title"]
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

	def destroy
		movie = Movie.find(params["id"])
		movie.destroy
	end
end
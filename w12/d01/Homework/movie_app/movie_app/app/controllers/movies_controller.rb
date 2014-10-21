# HTTParty.post("http://localhost:3000/movies.json", :body => {"title" => "Rocky IV", "year" => 1985, "poster_url" =>"http://content7.flixster.com/movie/26/13/261393_det.jpg" })
# HTTParty.post("http://localhost:3000/movies.json", :body => {"title" => "Rocky III", "year" => 1982, "poster_url" =>"http://ia.media-imdb.com/images/M/MV5BMTMyOTYzMDMzMF5BMl5BanBnXkFtZTcwMTkzODM1NA@@._V1_SX214_AL_.jpg" })

class MoviesController < ApplicationController

	def index
		movies = Movie.all()
		respond_to do |format|
			format.json { render :json => movies }
		end
	end

	def create 
		new movie = Movie.create(
			title: params["title"],
			year: params["year"],
			poster_url: params["poster_url"]
		)
		respond_to do |format|
			format.json { render :json => new_movie }
		 end
	end

	def update
		movie = Movie.find(params[:id])
		movie.update(
			title: params["title"],
			year: params["year"],
			poster_url: params["poster_url"]
		)
		respond_to do |format|
			format.json { render :json => movie }
		end
	end

	def destroy
		movie = Movie.find(params[:id])
		movie.destroy
	end

###
end
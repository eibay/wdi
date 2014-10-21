class MoviesController < ApplicationController

	#HTTParty.get('http://localhost:3000/movies.json')
	def index
		movies = Movie.all

		respond_to do |format|
			format.json { render :json => movies }
		end
	end

	#Good input
	#HTTParty.post('http://localhost:3000/movies.json', :body => {title: "The Godfather", year: 1972})
	#Bad input
	#HTTParty.post('http://localhost:3000/movies.json', :body => {title: "The Godfather"})  
	def create
		movie = Movie.new(title: params["title"], year: params["year"], poster_url: params["poster_url"])

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
	#HTTParty.put('http://localhost:3000/movies/1.json', :body => {name: "sean", real_identity: "john"})
	#Bad input
	#HTTParty.put('http://localhost:3000/movies/1.json', :body => {name: "sean"})  
	def update
		movie = Movie.find(params[:id])
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

end

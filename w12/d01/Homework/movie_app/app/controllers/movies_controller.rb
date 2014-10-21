class MoviesController < ApplicationController


	def index
		movies = Movie.all
		respond_to do |format|
			format.json { render :json => movies.to_json}
		end
	end

	def create
		hash = {title: params["title"], year: params["year"], poster_url: params["poster_url"]}
		movie = Movie.create(hash)
		respond_to do |format|
			format.json do
				if movie.valid?
					render :json => movie.to_json
				else
					render :json => movie.errors.messages.to_json
				end
			end
		end
	end

	def update
		movie = Movie.find(params["id"])
		movie.title = params["title"]
		movie.year = params["year"]
		poster_url = params["poster_url"]
		respond_to do |format|
			format.json do
				if movie.valid?
					movie.save
					render :json => movie.to_json
				else
					render :json => movie.errors.messages.to_json
				end
			end
		end
	end

	def destroy
		movie = Movie.find(params["id"])
		movie.destroy
		respond_to do |format|
			format.json { render :json => movie }
		end
	end

end

# HTTParty.get("http://localhost:3000/movies.json")

# HTTParty.post("http://localhost:3000/movies.json", body: {"title" => "Brain Candy", "year" => "1996", "poster_url" => "http://www.impawards.com/1996/posters/kids_in_the_hall_brain_candy_xlg.jpg"})
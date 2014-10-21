class MoviesController < ApplicationController
	
	#HTTParty.get('http://localhost:3000/movies.json')
	def index
		movies = Movie.all

		respond_to do |format|
			format.json { render :json => movies }
		end
	end

#HTTParty.post('http://localhost:3000/movies.json', :body => {title: "Star Wars", year: 1977, poster_url: "http://the-gadgeteer.com/wp-content/uploads/2014/05/starwars.jpg"})

def create
	movie = Movie.create(
		title: params[:title], 
		year: params[:year], 
		poster_url: params[:poster_url]
		)
	respond_to do |format|
		format.json { render :json => movie }
	end
end

#HTTParty.put('http://localhost:3000/movies/1.json', :body => {title: "Star Wars: A New Hope", year: 1977, poster_url: "http://the-gadgeteer.com/wp-content/uploads/2014/05/starwars.jpg"})

def update
	movie = Movie.find(params[:id])
	movie.title = params[:title]
	movie.year = params[:year]
	movie.poster_url = params[:poster_url]

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
	movie = Movie.find(params[:id])
	movie.destroy
end

end	


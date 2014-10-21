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





#HTTParty.get('http://localhost:3000/movies.json')

#HTTParty.post('http://localhost:3000/movies.json', :body => {title: "Big Lebowski", year: "1998", poster_url: params["http://ecx.images-amazon.com/images/I/51909Q031VL._SY300_.jpg"]})
	
#HTTParty.put('http://localhost:3000/movies/1.json', :body => {title: "Big Lebowski", year: "1998", poster_url: params["http://ecx.images-amazon.com/images/I/51909Q031VL._SY300_.jpg"]})


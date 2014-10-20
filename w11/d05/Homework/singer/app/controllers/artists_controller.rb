require 'pry'
class ArtistsController < ApplicationController

	def index
		@artist = Artist.new()
		@artists = Artist.all()
		render(:index)
	end

	def create
		@artist = Artist.new(:name => params[:name][:attr], :genre => params[:genre][:attr], :number_of_albums => params[:number_of_albums][:attr])

		if @artist.save
			redirect_to root_path
		else
			render :new
		end
	end



		# # Instantiate a new object using form parameters
		# @artist = Artist.new(artist_params)
		# # Save the object
		# if @artist.save
		# # If save succeeds, redirect to the index action
		# 	redirect_to(:action => 'index')
		# else
		# # If save fails, redisplay the form so use can fix problems
		# 	render('new')
		# end
	

	def edit
	end


	def show
		@artist = Artist.find(params[:id])
		@song = Song.new()
		@songs = Song.where(artist_id: @artist.id)
	end

	def update
		# Find an existing object using form parameters
		@artist = Artist.find(params[:id])
		# Update the object
		if @artist.update_attributes(artist_params)
		# If update succeeds, redirect to the index action
			redirect_to(:action => 'show', :id => @artist.id)
		else
		# If update fails, redisplay the form so use can fix problems
			render('edit')
		end
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy()
		redirect_to '/'
	end

end



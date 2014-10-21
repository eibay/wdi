# HTTParty.post("http://localhost:3000/actors.json", :body => {"fname" => "Nicholas", "lname" => "Cage", "picture_url" =>"http://i.imgur.com/b4dYgGz.jpg" })
# HTTParty.post("http://localhost:3000/actors.json", :body => {"fname" => "Sly", "lname" => "Stallone", "picture_url" =>"http://i.imgur.com/b4dYgGz.jpg" })

class ActorsController < ApplicationController

	def index
		actors = Actor.all()
		respond_to do |format|
			format.json { render :json => actors }
		end
	end

	def create 
		new actor = Actor.create(
			fname: params["fname"],
			lname: params["lname"],
			picture_url: params["picture_url"]
		)
		respond_to do |format|
			format.json { render :json => new_actor }
		 end
	end

	def update
		actor = Actor.find(params[:id])
		actor.update(
			fname: params["fname"],
			lname: params["lname"],
			picture_url: params["picture_url"]
		)
		respond_to do |format|
			format.json { render :json => actor }
		end
	end

	def destroy
		actor = Actor.find(params[:id])
		actor.destroy
	end

###
end
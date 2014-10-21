class ActorsController < ApplicationController

#HTTParty.get('http://localhost:3000/actors.json')
def index
	actors = Actor.all

	respond_to do |format|
		format.json { render :json => actors }
	end
end

#HTTParty.post('http://localhost:3000/actors.json', :body => {fname: "Harrison", lname: "Ford", picture_url: "http://img4.wikia.nocookie.net/__cb20090928140306/starwars/images/2/29/Harrisonford.jpg"})

def create
	actor = Actor.create(
		fname: params[:fname], 
		lname: params[:lname], 
		picture_url: params[:picture_url]
		)

	respond_to do |format|
		format.json { render :json => actor }
	end
end

def update
	actor = Actor.find(params[:id])
	actor.fname = params[:fname]
	actor.lname = params[:lname]
	actor.picture_url = params[:picture_url]

	respond_to do |format|
		format.json do
			if actor.valid?
				actor.save
				render :json => actor
			else
				render :json => actor.errors.messages.to_json
			end
		end
	end
end

def destroy
	actor = Actor.find(params[:id])
	actor.destroy
end

end
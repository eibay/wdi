class ActorsController < ApplicationController

	def index
		actors = Actor.all
		respond_to do |format|
			format.json { render :json => actors.to_json }
		end
	end

	def create
		hash = {f_name: params["f_name"], l_name: params["l_name"], picture_url: params["picture_url"]}
		actor = Actor.create(hash)
		respond_to do |format|
			format.json do
				if actor.valid?
					render :json => actor
				else
					render :json => actor.errors.messages.to_json
				end
			end
		end
	end

	def update
		actor = Actor.find(params["id"])
		actor.f_name = params["f_name"]
		actor.l_name = params["l_name"]
		actor.picture_url = params["picture_url"]
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

	def delete
		actor = Actor.find(params["id"])
		actor.destroy
		respond_to do |format|
			format.json { render :json => actor }
		end
	end

end


# HTTParty.get("http://localhost:3000/actors.to_json")

# HTTParty.post("http://localhost:3000/actors.json", :body => {"f_name" => "Sigourney", "l_name" => "Weaver", "picture_url" => "http://img2.wikia.nocookie.net/__cb20130410133950/avp"})

#Bad PUT request
# HTTParty.put("http://localhost:3000/actors/13.json", :body => {f_name: "Sigourney", l_name: "", picture_url: "http://img2.wikia.nocookie.net/__cb20130410133950/avp/images/2/2f/Ellen_Ripley_badass.png"})

#Good PUT request
#HTTParty.put("http://localhost:3000/actors/13.json", :body => {f_name: "Sigourney", l_name: "Weaver", picture_url: "http://img2.wikia.nocookie.net/__cb20130410133950/avp/images/2/2f/Ellen_Ripley_badass.png"})

# HTTParty.delete("http://localhost:3000/actors/1.json")


class PuppiesController < ActionController::Base

def index
	@puppies = Puppy.all()
end


def add_puppy
	Puppy.create({
		name: params["name"],
		breed: params["breed"],
		cutness: params["cutness"]
		})
	redirect_to '/'
 	end
	
	# redirect '/puppies'
end

class SuperherosController < ApplicationController


	def index
		superheros = Superhero.all

		respond_to do |format|
			format.json { render :json => superheros}
		end 
	end 

	def create 
		if params["name"] == nil || params["real_identity"] == nil || params["age"]== nil
			respond_to do |format|
				format.json { render :json => "Please enter all attributes!"}	
			end 
		else 
			name = params["name"]
			real_identity = params["real_identity"]
			age = params["age"]
			powers = params["powers"]
			superhero = Superhero.create({name: name, real_identity: real_identity, age: age, powers: powers})
			respond_to do |format|
				format.json { render :json => superhero }
			end
		end 
	end 

	def update
		superhero = Superhero.find(params["id"])
		if params["name"] != nil
			superhero.name = params["name"]
		end 
		if params["real_identity"] != nil 
			superhero.real_identity = params["real_identity"]
		end
		if params["age"] != nil
			superhero.age = params["age"]
		end 
		if params["powers"] != nil
			superhero.powers = params["powers"]
		end 
		superhero.save

		respond_to do |format|
			format.json { render :json => superhero}
		end 
	end 
end 


# HTTParty.post("http://localhost:3000/superheros", :body => {name:"Iris", powers:"funny", real_identity:"poop", age:12})
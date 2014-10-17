class PuppiesController < ApplicationController
  def index
  end

  def create
  	Puppy.create(name: params["name"], breed: params["breed"], cuteness: params["cuteness"])
  end

  def show
  	@puppy = Puppy.find(params[:id])
  end

  def delete
  	@puppy = Puppy.find(params[:id])
  	@puppy.destroy
  end

  def update
    puppies = {
      name: params["name"],
      breed: params["breed"],
      cuteness: params["cuteness"]
    }
    @puppy = Puppy.find(params[:id])
    @puppy.update(puppies)
  end

  def all
  	@puppies = Puppy.all()
  end

end

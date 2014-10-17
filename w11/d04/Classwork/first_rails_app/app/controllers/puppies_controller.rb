class PuppiesController < ApplicationController
  def index
  @puppies = Puppy.all()
end

   def create
    Puppy.create(name: params["name"], breed: params["breed"], cuteness: params["cuteness"])
  end
end

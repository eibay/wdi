class PuppiesController < ApplicationController
  def index
  end

  def create
  	Puppy.create(name: params["name"], breed: params["breed"], cuteness: params["cuteness"])
  	redirect "/"
  end
end

class PuppiesController < ApplicationController
  # skip_before_filter  :verify_authenticity_token

def index
  @puppies = Puppy.all()
end

def show
  @puppy = Puppy.find(params[:id]).destroy
  render 'index'
end

def create
  @puppies = Puppy.create({name: params[:name], breed: params[:breed], cuteness: params[:cuteness] })
  render 'index'
end

# def id
#   @puppy = Puppy.find(params[:id]).destroy
#   # redirect_to 'index'
# end

end

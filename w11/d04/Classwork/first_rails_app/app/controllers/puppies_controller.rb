class PuppiesController < ApplicationController
  # skip_before_filter  :verify_authenticity_token

def index
  @puppies = Puppy.all()
end

def show
  @puppies = Puppy.all()
end

end

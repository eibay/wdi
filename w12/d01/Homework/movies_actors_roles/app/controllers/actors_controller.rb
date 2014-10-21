class ActorsController < ApplicationController
def index
    actors = Actor.all
    respond_to do |format|
      format.json do 
        render :json => actors
      end
      format.html do
        render text: "hey"
      end
    end
end

def create
actor = Actor.create(fname: params["fname"], lname: params["lname"], picture_url: params["picture_url"])
respond_to do |format|
  format.json do
    render :json => actor
  end
end
end

def update
  actor = actor.find(params[:id])
  newActor = {fname: params["fname"], lname: params["lname"], picture_url: params["picture_url"]}
  actor.update(newActor)
  respond_to do |format|
    format.json do
      render :json => actor
    end
  end
end


def destroy
  actors = Actor.all
  actor = Actor.find(params[:id])
  actor.destroy
    respond_to do |format|
    format.json do
      render :json => actors
    end
  end
end

end
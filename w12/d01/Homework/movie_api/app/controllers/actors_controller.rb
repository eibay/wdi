class ActorsController < ApplicationController 

    def index 
      actors = Actor.all 

      # # list roles an actor has had, like this 
      # actors.each do |actor|
      #   actor["roles"] = Role.where actor_id: actor.id 
      # end 
    end 

    respond_to do |format|
      format.json { render :json => actors }
    end 
end 


def create 
  actor = Actor.new(
    fname: params["fname"],
    lname: params["lname"],
    picture_url: params["picture_url"]
  )

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

def update 
  actor = Actor.find_by_id params[:id]
  actor.fname = params["fname"],
  actor.lname = params["lname"],
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
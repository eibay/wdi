class ActorsController < ApplicationController

  def index
    actors = Actor.all
    respond_to do |format|
    format.json { render :json => actors }
    end
  end

  def create
    add_actor = Actor.new(fname: params["fname"], lname: params["lname"], picture_url: params["picture_url"])

    respond_to do |format|
      format.json do
        if add_actor.valid?
          add_actor.save
          render :json => add_actor
        else
          render :json => add_actor.errors.messages.to_json
        end
      end
    end
 end

 def show
    show_actor = Actor.find(params[:id])
    respond_to do |format|
    format.json{render :json => show_actor}
    end
 end

 def update
    edit_actor = Actor.find(params[:id])
    edit_actor.fname = params["fname"]
    edit_actor.lname = params["lname"]
    edit_actor.picture_url = params["picture_url"]

    respond_to do |format|
      format.json do
        if edit_actor.valid?
          edit_actor.save
          render :json => edit_actor
        else
          render :json => edit_actor.errors.messages.to_json
        end
      end
    end
  end

  def destroy
    delete_actor = Actor.find(params[:id])
    delete_actor.destroy

    # redirect_to '/actors'
 end
end


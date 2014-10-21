class RolesController < ApplicationController

def index
    roles = Role.all
    respond_to do |format|
    format.json { render :json => roles }
    end
  end

  def create
    add_role = Role.new(character_name: params["character_name"], movie_id: params["movie_id"], actor_id: params["actor_id"])

    respond_to do |format|
      format.json do
        if add_role.valid?
          add_role.save
          render :json => add_role
        else
          render :json => add_role.errors.messages.to_json
        end
      end
    end
 end

 def show
    show_role = Role.find(params[:id])
    respond_to do |format|
    format.json{render :json => show_role}
    end
 end

 def update
    edit_role = Role.find(params[:id])
    edit_role.character_name = params["character_name"]
    edit_role.movie_id = params["movie_id"]
    edit_role.actor_id = params["actor_id"]

    respond_to do |format|
      format.json do
        if edit_role.valid?
          edit_role.save
          render :json => edit_role
        else
          render :json => edit_role.errors.messages.to_json
        end
      end
    end
  end

  def destroy
    delete_role = Role.find(params[:id])
    delete_role.destroy

    # redirect_to '/roles'
  end
end
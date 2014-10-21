class RolesController < ApplicationController


   def index
    roles = Role.all
    respond_to do |format|
      format.json do 
        render :json => roles
      end
      format.html do
        render text: "hey"
      end
    end
end

def create
role = Role.create(character_name: params["character_name"], movie_id: params["movie_id"], actor_id: params["actor_id"])
respond_to do |format|
  format.json do
    render :json => role
  end
end
end

def update
  role = Role.find(params[:id])
  newRole = {character_name: params["character_name"], movie_id: params["movie_id"], actor_id: params["actor_id"]}
  role.update(newRole)
  respond_to do |format|
    format.json do
      render :json => role
    end
  end
end


def destroy
  roles = Role.all
  role = Role.find(params[:id])
  role.destroy
    respond_to do |format|
    format.json do
      render :json => roles
    end
  end
end


end
class RolesController < ApplicationController
  def index
    roles = Role.all
    respond_to do |format|
      format.json { render :json => roles}
    end
  end

  def create
    role = Role.all
    Role.create(character_name: params[:character_name], movie_id: params[:movie_id], actor_id: params[:actor_id])

    respond_to do |format|
      format.json { render :json => role}
    end
  end

  def update
    roles = Role.all

    role = Role.find(params[:id])
    role.update(character_name: params[:character_name], movie_id: params[:movie_id], actor_id: params[:actor_id])

    respond_to do |format|
      format.json { render :json => roles }
    end
  end
end

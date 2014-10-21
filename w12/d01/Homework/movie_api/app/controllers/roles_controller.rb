class RolesController < ApplicationController 
  def index 
    roles = Role.all
    # # transform roles data into useful information 
    # roles.map do |role|
    #   [role.name, 
    #     Actor.find_by_id(role.actor_id), 
    #     Movie.find_by_id(role.movie_id)]  
    # end  
    respond_to do |format|
      format.json { render :json => roles}
    end 
  end 

  def create 
    role = Role.new(
      character_name: params["character_name"],
      movie_id: params["movie_id"],
      actor_id: params["actor_id"]
      )
    respond_to do |format|
      format.json do 
        if role.valid? 
          role.save 
          render :json => role 
        else 
          render :json => role.errors.messages.to_json 
        end 
      end 
    end 
  end

  def show
    role = Role.find_by_id params[:id]
    respond_to do |format|
      format.json { render :json => role }
    end  
  end 

  def delete
    role = Role.find_by_id params[:id]
    role.destroy  
  end 

  def update
    role = Role.find_by_id params[:id]
    role.character_name = params["character_name"],
    role.movie_id = params["movie_id"],
    role.actor_id = params["actor_id"]

    respond_to do |format|
      format.json do 
        if role.valid?
          role.save 
          render :json => role 
        else 
          render :json => role.errors.messages.to_json 
        end 
      end  
    end 
  end  
end 
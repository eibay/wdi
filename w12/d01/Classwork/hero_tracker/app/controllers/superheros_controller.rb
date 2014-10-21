class SuperherosController < ApplicationController

def index
  # heroes = Superhero.all
  # render "index", locals: {heroes: heroes}
  # "HELLO"
  superheroes = Superhero.all
  respond_to do |format|
    format.json { render :json => superheroes }
    format.html { render :html => 'index'}
  end
end

def create
  name = params[:name]
  real_identity = params[:real_identity]
  powers = params[:powers]
  age = params[:age]
  city_id = params[:city_id]

  Superhero.create(name: name, real_identity: real_identity, powers: powers, age: age, city_id: city_id)

  respond_to do |format|
    format.json { render :json => "Thanks."}
  end

end

def update
  binding.pry
  if !params.has_key?(:name) ? format.json {render :json => "Bad input".to_json}
  if !params.has_key?(:real_identity) ? format.json {render :json => "Bad input".to_json}
  if !params.has_key?(:powers) ? format.json {render :json => "Bad input".to_json}
  if !params.has_key?(:age) ? format.json {render :json => "Bad input".to_json}
  if !params.has_key?(:city_id) ? format.json {render :json => "Bad input".to_json}

  hero = Superhero.find(name: params[:name], real_identity: params[:real_identity], powers: params[:powers], age: params[:age], city_id: params[:city_id])
  hero.update()

  respond_to do |format|
    format.json { render :json => hero}
  end

end


end

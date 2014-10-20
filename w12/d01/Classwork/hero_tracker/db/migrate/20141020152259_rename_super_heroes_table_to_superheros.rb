# rails g migration RenameSuperHeroesTableToSuperheros
# rake db:migrate

class RenameSuperHeroesTableToSuperheros < ActiveRecord::Migration
  def change
  	rename_table :superheroes, :superheros
  end
end

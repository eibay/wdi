class RenameSuperheroesTabletoSuperheros < ActiveRecord::Migration
  def change
    rename_table :superheroes, :superheros
  end
end

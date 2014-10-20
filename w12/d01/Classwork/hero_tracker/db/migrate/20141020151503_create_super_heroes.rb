# rails g migration CreateSuperHeroesTable
# rake db:migrate

class CreateSuperHeroes < ActiveRecord::Migration
  def change
    create_table :superheroes do |t|
    	t.string :name
    	t.string :secret_identity

    	t.timestamps     
    end
  end
end

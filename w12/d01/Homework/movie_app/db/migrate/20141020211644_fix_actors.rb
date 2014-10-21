class FixActors < ActiveRecord::Migration
  def change
  	rename_column :actors, :poster_url, :fname
  	rename_column :actors, :title, :lname
  	add_column :actors, :picture_url, :string
  end
end

class RemoveCarsColumnfromSuperhero < ActiveRecord::Migration
  def change
  	remove_column :superheros, :cars
  end
end

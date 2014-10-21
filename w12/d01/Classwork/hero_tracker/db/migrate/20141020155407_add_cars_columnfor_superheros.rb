class AddCarsColumnforSuperheros < ActiveRecord::Migration
  def change
  	add_column :superheros, :cars, :string
  end
end

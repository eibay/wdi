class RemoveStateFromCities < ActiveRecord::Migration
  def change
  	remove_column :cities, :state, :string
  end
end

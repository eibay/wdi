class RemoveStateFromCities < ActiveRecord::Migration
  def change
  	change_table :cities do |t|
  		t.remove :state
  	end
  end
end

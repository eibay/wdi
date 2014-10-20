class RemoveCarsFromDatabase < ActiveRecord::Migration
  def change
    drop_table :cars
  end
end

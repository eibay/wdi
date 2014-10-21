class ChangeNameOfCitiesTable < ActiveRecord::Migration
  def self.up
  	rename_table :cities_tables, :cities
  end

  def self.down
  	rename_table :cities_tables, :cities
  end
end

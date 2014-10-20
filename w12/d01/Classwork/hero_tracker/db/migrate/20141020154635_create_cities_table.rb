class CreateCitiesTable < ActiveRecord::Migration
  def change
    create_table :cities_tables do |t|
    	t.string :name
    	t.string :state
    end
  end
end

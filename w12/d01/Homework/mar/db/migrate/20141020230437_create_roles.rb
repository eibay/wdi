class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :character_name
    	t.belongs_to :movie
    	t.belongs_to :actor
    end
  end
end

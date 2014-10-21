class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
    	t.string :fname
    	t.string :lname
    	t.text :picture_url
    	t.timestamps
    end
  end
end

class CreateActor < ActiveRecord::Migration
  def change
    create_table :actors do |t|
    	t.string :fname
    	t.string :lname
    	t.string :picture_url
    end
  end
end

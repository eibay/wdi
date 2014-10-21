class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
    	t.string :f_name
    	t.string :l_name
    	t.string :picture_url
    end
  end
end

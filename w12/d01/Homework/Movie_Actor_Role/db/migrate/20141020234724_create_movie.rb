class CreateMovie < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :title
    	t.string :year
    	t.string :poster_url
    end
  end
end

class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
			t.string :title
			t.date :year
			t.text :poster_url
    end
  end

  
end

class RemoveMovieIdFromActors < ActiveRecord::Migration
  def change
    remove_column :actors, :movie_id, :integer
  end
end

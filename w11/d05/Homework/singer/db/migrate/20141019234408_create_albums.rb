class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.integer :artist_id
      t.integer :year

      t.timestamps
    end
  end
end

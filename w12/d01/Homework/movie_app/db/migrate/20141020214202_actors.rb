class Actors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :fname
      t.string :lname
      t.string :picture_url

      t.timestamps
    end
  end
end

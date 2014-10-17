class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|

      t.timestamps
    end
  end
end

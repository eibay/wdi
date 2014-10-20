class AddPowersColumntoSuperheros < ActiveRecord::Migration
  def change
  	add_column :superheros, :powers, :string
  end
end

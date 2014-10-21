class AddCitiesToSuperheroes < ActiveRecord::Migration
  def change
    add_column :superheros, :city_to_protect, :string
  end
end

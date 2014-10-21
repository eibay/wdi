class RenameCities < ActiveRecord::Migration
  def change
      remove_column :superheros, :city_to_protect
      add_column :superheros, :city_id, :integer
  end
end

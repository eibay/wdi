class AddColumnForCitiesInSuperheros < ActiveRecord::Migration
  def change
    add_reference :superheros, :city, index: true
  end
end

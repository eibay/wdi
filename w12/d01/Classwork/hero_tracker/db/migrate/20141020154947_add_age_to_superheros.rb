class AddAgeToSuperheros < ActiveRecord::Migration
  def change
    add_column :superheros, :age, :integer 
  end
end

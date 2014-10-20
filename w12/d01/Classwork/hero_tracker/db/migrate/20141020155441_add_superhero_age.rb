class AddSuperheroAge < ActiveRecord::Migration
  def change
    add_column :superheros, :age, :integer
    # add_column :tablename :columnname :datatype
  end
end

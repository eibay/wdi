class DestroyCities < ActiveRecord::Migration
  def change
    remove_column :cities, :state
    # remove_column :tablename, :column_to_remove
    # drop_table :cities
  end
end

class ChangeColumnInSuperheros < ActiveRecord::Migration
  def change
  	rename_column :superheros, :secret_identity, :real_identity
  end
end

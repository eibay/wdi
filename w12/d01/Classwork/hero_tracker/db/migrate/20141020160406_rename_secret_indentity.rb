class RenameSecretIndentity < ActiveRecord::Migration
  def change
    rename_column :superheros, :secret_identity, :real_identity
    # rename_column :table, :old_column, :new_column

  end
end

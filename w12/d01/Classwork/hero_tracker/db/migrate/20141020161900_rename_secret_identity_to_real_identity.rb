class RenameSecretIdentityToRealIdentity < ActiveRecord::Migration
  def change
  	remane_column :superheroes, :secret_identity, :real_identity
  end
end

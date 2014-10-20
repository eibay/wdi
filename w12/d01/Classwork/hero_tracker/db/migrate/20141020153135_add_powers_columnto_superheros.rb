# rails g migration AddPowersColumntoSuperheros
# rake db:migrate

class AddPowersColumntoSuperheros < ActiveRecord::Migration
  def change
  	add_column :superheros, :powers, :string
  end
end

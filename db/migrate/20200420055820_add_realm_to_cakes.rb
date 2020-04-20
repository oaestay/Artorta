class AddRealmToCakes < ActiveRecord::Migration[5.2]
  def up
    add_column :cakes, :realm, :integer
    Cake.update_all(realm: 0)
  end

  def down
    remove_column :cakes, :realm
  end
end

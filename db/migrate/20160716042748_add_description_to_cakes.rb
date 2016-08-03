class AddDescriptionToCakes < ActiveRecord::Migration
  def change
    add_column :cakes, :description, :string
  end
end

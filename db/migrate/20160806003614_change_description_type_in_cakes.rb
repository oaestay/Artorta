class ChangeDescriptionTypeInCakes < ActiveRecord::Migration
  def change
    change_column :cakes, :description, :text, default: ""
  end
end

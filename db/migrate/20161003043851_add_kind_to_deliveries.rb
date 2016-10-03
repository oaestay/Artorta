class AddKindToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :kind, :string
  end
end

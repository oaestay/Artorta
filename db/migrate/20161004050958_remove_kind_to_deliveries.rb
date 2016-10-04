class RemoveKindToDeliveries < ActiveRecord::Migration
  def change
    remove_column :deliveries, :kind, :string
  end
end

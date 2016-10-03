class AddMailToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :mail, :string
  end
end

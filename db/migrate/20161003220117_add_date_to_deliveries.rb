class AddDateToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :date, :date
  end
end

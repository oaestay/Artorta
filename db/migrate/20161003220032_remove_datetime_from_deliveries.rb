class RemoveDatetimeFromDeliveries < ActiveRecord::Migration
  def change
    remove_column :deliveries, :datetime, :datetime
  end
end

class AddPopularityToCakes < ActiveRecord::Migration
  def change
    add_column :cakes, :popularity, :integer, default: 0
  end
end

class ChangeCategoryToIntegerInCakes < ActiveRecord::Migration[5.2]
  def up
    rename_column :cakes, :category, :old_category
    add_column :cakes, :category, :integer

    [
      :decoradas, :novios, :tradicionales, :cupcakes,
      :coctel, :postres, :pies, :chocolateria, :galletones
    ].each_with_index do |category, index|
      Cake.where(old_category: category).update_all(category: index)
    end
    remove_column :cakes, :old_category
  end

  def down
    add_column :cakes, :old_category, :string
    [
      :decoradas, :novios, :tradicionales, :cupcakes,
      :coctel, :postres, :pies, :chocolateria, :galletones
    ].each_with_index do |category, index|
      Cake.where(category: index).update_all(old_category: category)
    end
    remove_column :cakes, :category
    rename_column :cakes, :old_category, :category
  end
end

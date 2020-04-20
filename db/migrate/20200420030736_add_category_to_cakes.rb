class AddCategoryToCakes < ActiveRecord::Migration[5.2]
  def up
    rename_column :cakes, :category, :old_category
    add_reference :cakes, :category, foreign_key: true
    [
      :decoradas, :novios, :tradicionales, :cupcakes,
      :coctel, :postres, :pies, :chocolateria, :galletones
    ].each_with_index do |name, index|
      category_id = Category.find_by(name: name).id
      Cake.where(old_category: index).update_all(category_id: category_id)
    end
    remove_column :cakes, :old_category
  end

  def down
    add_column :cakes, :old_category, :integer
    [
      :decoradas, :novios, :tradicionales, :cupcakes,
      :coctel, :postres, :pies, :chocolateria, :galletones
    ].each_with_index do |name, index|
      category_id = Category.find_by(name: name)
      Cake.where(category: category_id).update_all(old_category: index)
    end
    remove_reference :cakes, :category, foreign_key: true
    rename_column :cakes, :old_category, :category
  end
end

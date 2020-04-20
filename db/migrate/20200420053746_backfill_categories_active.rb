class BackfillCategoriesActive < ActiveRecord::Migration[5.2]
  ACTIVE_CATEGORIES = ["decoradas", "novios", "tradicionales", "cupcakes", "coctel", "postres"]
  INACTIVE_CATEGORIES = ["pies", "chocolateria", "galletones"]

  def up
    Category.where(slug: ACTIVE_CATEGORIES).update_all(active: true)
    Category.where(slug: INACTIVE_CATEGORIES).update_all(active: false)
  end

  def down
    Category.update_all(active: true)
  end
end

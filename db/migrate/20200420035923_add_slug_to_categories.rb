class AddSlugToCategories < ActiveRecord::Migration[5.2]
  CATEGORY_NAMES = {
    "decoradas" => "Tortas Decoradas",
    "novios" =>  "Tortas de Novios",
    "tradicionales" =>  "Tortas Tradicionales",
    "cupcakes" => "Cupcakes",
    "coctel" => "Cóctel",
    "postres" => "Postres",
    "pies" =>  "Brazos",
    "chocolateria" => "Chocolatería",
    "galletones" => "Galletones"
  }

  def up
    add_column :categories, :slug, :string
    Category.all.each do |category|
      category.update! slug: category.name, name: CATEGORY_NAMES[category.name]
    end
  end

  def down
    Category.all.each { |category| category.update! name: category.slug }
    remove_column :categories, :slug
  end
end

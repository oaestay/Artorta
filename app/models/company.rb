class Company < ActiveRecord::Base
  validates :name, presence: { message: "Debe ingresar un nombre" }

  validates :image, attachment_presence: { message: "Debe subir una imagen" }
  has_attached_file :image, styles: { xl:"500x500", large: "420x420", medium: "300x300", small: "240x240" }, default_url: ActionController::Base.helpers.asset_path(":style/missing.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

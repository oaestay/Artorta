class WeddingTopping < ActiveRecord::Base
  validates :code, format: { with: /\A[A-Za-z0-9]+\Z/, message: "El código sólo puede tener letras y números"}
  validate :uniqueness_of_code, on: :create
  validates :code, presence: { message: "Debe ingresar un código" }
  validates :name, presence: { message: "Debe ingresar un nombre" }

  validates :image, attachment_presence: { message: "Debe subir una imagen" }
  has_attached_file :image, styles: { xl:"500x500", large: "420x420", medium: "300x300", small: "240x240" }, default_url: ActionController::Base.helpers.asset_path(":style/missing.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def uniqueness_of_code
    existing_record = WeddingTopping.find_by_code(code)
    unless existing_record.nil?
      errors.add(:code, "Producto #{existing_record.name} ya tiene el código #{code}")
    end
  end
end

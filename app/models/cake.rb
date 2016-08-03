class Cake < ActiveRecord::Base

  validates :code, format: { with: /\A[A-Za-z0-9]+\Z/, message: "El código sólo puede tener letras y números"}
  validate :uniqueness_of_code, on: :create
  validates :code, presence: { message: "Debe ingresar un código" }
  validates :name, presence: { message: "Debe ingresar un nombre" }

  validates :image, attachment_presence: { message: "Debe subir una imagen" }
  has_attached_file :image, styles: { large: "420x420", medium: "300x300", small: "240x240" }, default_url: ActionController::Base.helpers.asset_path(":style/missing.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :prices, -> { order 'portions' }

  acts_as_taggable

  accepts_nested_attributes_for :prices, reject_if: :all_blank, allow_destroy: true

  scope :decoradas, -> { where("category = 'decoradas'") }
  scope :novios, -> { where("category = 'novios'") }
  scope :tradicionales, -> { where("category = 'tradicionales'") }
  scope :cupcakes, -> { where("category = 'cupcakes'") }


  def uniqueness_of_code
    existing_record = Cake.find_by_code(code)
    unless existing_record.nil?
      errors.add(:code, "Producto #{existing_record.name} ya tiene el código #{code}")
    end
  end
end

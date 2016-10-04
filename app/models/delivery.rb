class Delivery < ActiveRecord::Base
  attr_accessor :terms_and_conditions
  validates :first_name, presence: { message: "Debe ingresar su nombre" }
  validates :last_name, presence: { message: "Debe ingresar su apellido" }
  validates :mail, presence: { message: "Debe ingresar su email" }
  validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Ingrese un email válido"
  validates :phone, presence: { message: "Debe ingresar un número de teléfono" }
  validates :phone, numericality: { only_integer: true, message: "Sólo puede cont" }
  validates :cellphone, presence: { message: "Debe ingresar un número de teléfono móvil" }
  validates :address, presence: { message: "Debe ingresar la dirección del despacho" }
  validates :province, presence: { message: "Debe seleccionar una comuna" }
  validates :terms_and_conditions, :acceptance => true
end

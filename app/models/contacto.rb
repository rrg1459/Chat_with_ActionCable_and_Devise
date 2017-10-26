class Contacto < ApplicationRecord
  belongs_to :user
  has_many :mensajes, dependent: :destroy

  validates :numero,      presence: { message: "en blanco" }

  validates_uniqueness_of :numero, scope: :operadora

  validates :nombre,      presence: { message: "en blanco" }, 
                length:   {minimum: 3, :message => "debe tener por lo menos 3 letras"}
                
end

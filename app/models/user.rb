class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :contactos, dependent: :destroy
  has_many :mensajes, dependent: :destroy

  def name
    email.split('@')[0]
  end
end

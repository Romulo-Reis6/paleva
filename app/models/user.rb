class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :last_name, :cpf, :email, :password, presence: true
  validates_email_format_of :email
  validates :cpf, :email, uniqueness: true
  validates_cpf_format_of :cpf
  validates :password, length: { minimum: 12 }
end

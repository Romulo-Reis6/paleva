class Restaurant < ApplicationRecord
  before_create :generate_code
  belongs_to :user
  validates :brand_name, :corporate_name, :cnpj, :address, :phone, :email, presence: true
  validates :cnpj, :code, :email, uniqueness: true
  validates :phone, length: { minimum: 10, maximum: 11 }
  validates_cnpj_format_of :cnpj
  validates_email_format_of :email

  def generate_code
    loop do
      self.code = SecureRandom.alphanumeric(6)
      break unless Restaurant.exists?(code: code)
    end
  end
end
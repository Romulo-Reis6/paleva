class Beverage < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_one_attached :photo
end

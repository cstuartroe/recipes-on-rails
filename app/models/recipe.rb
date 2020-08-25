class Recipe < ApplicationRecord
  has_many :ingredient_quantities
  validates :title, presence: true, length: { minimum: 5 }
end

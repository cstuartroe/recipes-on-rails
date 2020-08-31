class IngredientQuantity < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, presence: true

  def to_s
    quantity.to_s + ' ' + ingredient.to_s(quantity > 1)
  end
end

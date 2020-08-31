class Recipe < ApplicationRecord
  has_many :ingredient_quantities
  validates :title, presence: true, length: { minimum: 5 }

  def quantities_by_ingredient_id
    @quantities_by_ingredient_id ||= get_quantities_by_ingredient_id
  end

  private

  def get_quantities_by_ingredient_id
    quantities_by_ingredient_id = {}
    ingredient_quantities.each do |ingredient_quantity|
      quantities_by_ingredient_id[ingredient_quantity.ingredient.id] = ingredient_quantity.quantity
    end
    quantities_by_ingredient_id
  end
end

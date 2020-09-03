class Ingredient < ApplicationRecord
  has_many :ingredient_quantities
  validates :name, presence: true

  def to_s(plural = true)
    s = (plural ? 's' : '')
    if unit != ''
      unit + s + ' of ' + name
    else
      name + s
    end
  end
end

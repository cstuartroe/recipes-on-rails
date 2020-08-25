class Ingredient < ApplicationRecord
  has_many :ingredient_quantities
  validates :name

  def to_string(plural=true)
    s = (plural ? 's' : '')
    if @unit
      @unit + s + ' of ' + @name
    else
      @name + s
    end
  end
end

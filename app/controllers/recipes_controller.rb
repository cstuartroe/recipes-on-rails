class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params.require(:id))
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params.require(:id))
  end

  def create
    @recipe = Recipe.new(recipe_params)

    render 'new' unless @recipe.save

    ingredient_quantities.each do |ingredient, quantity|
      IngredientQuantity.new(ingredient: ingredient, quantity: quantity, recipe: @recipe).save
    end

    redirect_to @recipe
  end

  def update
    @recipe = Recipe.find(params.require(:id))

    render 'edit' unless @recipe.update(recipe_params)

    ingredient_quantities.each do |ingredient, quantity|
      iqs = IngredientQuantity.where(ingredient: ingredient, recipe: @recipe)
      if iqs.any?
        iqs[0].update(quantity: quantity)
      else
        IngredientQuantity.new(ingredient: ingredient, quantity: quantity, recipe: @recipe).save
      end
    end

    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find(params.require(:id))
    @recipe.destroy

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :text)
  end

  def ingredient_quantities
    recipe = params.require(:recipe)
    ingredient_quantities = {}
    Ingredient.all.each do |ingredient|
      ingredient_quantities[ingredient] = recipe['ing_' + ingredient.id.to_s].to_i
    end
    ingredient_quantities
  end
end

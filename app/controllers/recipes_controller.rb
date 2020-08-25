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

    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params.require(:id))

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params.require(:id))
    @recipe.destroy

    redirect_to articles_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :text)
  end
end
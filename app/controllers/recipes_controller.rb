class RecipesController < ApplicationController
 
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ing_meas = @recipe.ingredients_measurements.build
    @ing_meas.build_ingredient
  end

  def create
    recipe = Recipe.create recipe_params
    redirect_to(recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes recipe_params
    redirect_to(recipe)
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect_to(recipes_path)
  end

  private
    def recipe_params
       # raise params.inspect
      params.require(:recipe).permit(:name, :course, :cooktime, :servingsize, :instructions, ingredients_measurements_attributes: [:quantity, ingredient_attributes: [:name, :brand] ])
    end
end

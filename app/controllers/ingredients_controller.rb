class IngredientsController < ApplicationController
  
  before_action :laod_ingredient, only: [:show, :edit, :update, :destroy]
  
  def index
    @ingredient = Recipe.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.create ingredient_params
    redirect_to(ingredient)
  end

  def show
  laod_ingredient
  end

  def edit
    laod_ingredient
  end

  def update
   laod_ingredient
    ingredient.update_attributes ingredient_params
    redirect_to(ingredient)
  end
  
  def destroy
    laod_ingredient
    ingredient.delete
    redirect_to(ingredient_path)
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :brand, :image)
    end
    def laod_ingredient
       @ingredient = Ingredient.find(params[:id])
  end
end

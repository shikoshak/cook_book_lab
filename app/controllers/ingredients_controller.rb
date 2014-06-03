class IngredientsController < ApplicationController
  
  before_action :laod_ingredient, only: [:show, :edit, :update, :destroy]
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
    @ingredient.ingredients_measurements.build
  end

  def create
    ingredient = Ingredient.create ingredient_params
    redirect_to(ingredient)
  end

  def show
  
  end

  def edit
  end

  def update
    ingredient.update_attributes ingredient_params
    redirect_to(ingredient)
  end
  
  def destroy
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

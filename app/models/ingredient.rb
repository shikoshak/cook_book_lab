class Ingredient < ActiveRecord::Base
    has_many :recipes, through: :ing_quantity
end

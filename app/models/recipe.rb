class Recipe < ActiveRecord::Base
    has_many :ing_quantities
    has_many :recipes, through: :ing_quantity
end

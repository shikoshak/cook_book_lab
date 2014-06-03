class Recipe < ActiveRecord::Base
   has_many :ing_quantities
	has_many :ingredients, through: :ing_quantities
	accepts_nested_attributes_for :ing_quantities
end

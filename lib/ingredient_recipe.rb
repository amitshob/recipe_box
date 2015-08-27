class Ingredient_Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes
end

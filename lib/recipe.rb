class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_many(:instructions)
  has_and_belongs_to_many(:tags)
  #has_many: :ingredients, through: :ingredients_recipes
end

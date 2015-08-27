class IngredientsRecipesRename < ActiveRecord::Migration
  def self.up
    rename_table :ingredient_recipe, :ingredients_recipes
  end
end

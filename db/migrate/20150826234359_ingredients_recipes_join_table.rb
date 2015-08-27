class IngredientsRecipesJoinTable < ActiveRecord::Migration
  def change
    create_table(:ingredient_recipe) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end
  end
end

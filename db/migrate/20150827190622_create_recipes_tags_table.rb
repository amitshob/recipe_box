class CreateRecipesTagsTable < ActiveRecord::Migration
  def change
    create_table(:recipes_tags) do |t|
      t.column(:recipe_id, :integer)
      t.column(:tag_id, :integer)


      t.timestamps()
    end
  end
end

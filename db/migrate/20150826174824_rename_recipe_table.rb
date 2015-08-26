class RenameRecipeTable < ActiveRecord::Migration
  def self.up
    rename_table :recipe, :recipes
  end
end

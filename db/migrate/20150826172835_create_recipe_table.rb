class CreateRecipeTable < ActiveRecord::Migration
  def change
    create_table(:recipe) do |t|
      t.column(:name, :string)
      t.column(:rating, :integer)

      t.timestamp()
    end
  end
end

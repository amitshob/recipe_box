class CreateIngredientsTable < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.column(:food_group, :string)

      t.timestamps()
    end
  end
end

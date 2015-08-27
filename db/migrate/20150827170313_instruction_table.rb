class InstructionTable < ActiveRecord::Migration
  def change
    create_table(:instructions) do |t|
      t.column(:description, :string)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end
  end
end

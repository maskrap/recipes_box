class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:ingredients, :string)
      t.column(:instructions, :string)
    end
  end
end

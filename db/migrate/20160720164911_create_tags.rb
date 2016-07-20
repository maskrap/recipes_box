class CreateTags < ActiveRecord::Migration
  def change
    create_table(:tags) do |t|
      t.column(:category, :string)
      t.column(:recipe_id, :integer)
    end
  end
end

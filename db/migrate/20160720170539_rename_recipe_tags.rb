class RenameRecipeTags < ActiveRecord::Migration
  def change
    rename_table :recipe_tags, :recipes_tags
  end
end

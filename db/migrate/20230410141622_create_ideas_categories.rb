class CreateIdeasCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :idea, null: false, foreign_key: true

      t.timestamps
    end
  end
end

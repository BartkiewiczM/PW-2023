class CreateIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.string :comment
      t.string :attachment
      t.integer :status
      t.string :link
      t.references :opportunity, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

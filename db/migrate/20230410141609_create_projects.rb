class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name

      t.timestamps
    end
  end
end

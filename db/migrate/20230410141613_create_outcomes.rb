class CreateOutcomes < ActiveRecord::Migration[7.0]
  def change
    create_table :outcomes do |t|
      t.string :notes
      t.string :name
      t.references :goal, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

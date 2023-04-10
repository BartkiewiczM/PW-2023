class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :notes
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

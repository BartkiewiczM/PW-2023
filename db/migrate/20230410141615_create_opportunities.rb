class CreateOpportunities < ActiveRecord::Migration[7.0]
  def change
    create_table :opportunities do |t|
      t.string :name
      t.integer :source
      t.string :link
      t.references :outcome, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

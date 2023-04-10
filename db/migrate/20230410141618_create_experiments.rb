class CreateExperiments < ActiveRecord::Migration[7.0]
  def change
    create_table :experiments do |t|
      t.string :name
      t.references :idea, null: false, foreign_key: true
      t.string :description
      t.string :assumption
      t.integer :validation_technique
      t.string :metric
      t.string :success_metric
      t.string :outcome
      t.string :conclusion
      t.string :text_steps

      t.timestamps
    end
  end
end

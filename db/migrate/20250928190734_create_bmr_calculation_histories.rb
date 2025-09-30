class CreateBmrCalculationHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :bmr_calculation_histories do |t|
      t.string :formula
      t.decimal :result, precision: 12, scale: 3

      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end

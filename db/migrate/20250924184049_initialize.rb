class Initialize < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.date :birthday
      t.string :gender
      t.integer :height
      t.decimal :weight, precision: 5, scale: 2

      t.index %i[first_name last_name middle_name birthday], unique: true, name: 'index_patients_on_name_and_birthday'
      t.timestamps
    end

    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name

      t.timestamps
    end

    create_table :patients_doctors do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end

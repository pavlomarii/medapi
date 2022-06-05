class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name, index: true, null: false
      t.string :email, index: true
      t.string :phone, index: true
      t.integer :blood_type
      t.boolean :rhesus
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

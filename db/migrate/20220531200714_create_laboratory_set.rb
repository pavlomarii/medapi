class CreateLaboratorySet < ActiveRecord::Migration[7.0]
  def change
    create_table :laboratory_sets do |t|
      t.references :patient,null: false, foreign_key: true

      t.float :erythrocytes
      t.float :hemoglobin
      t.float :hematocrit
      t.float :platelets
      t.float :platelet
      t.float :leukocytes
      t.float :lymphocytes
      t.float :lymphocytes_percents
      t.float :monocytes
      t.float :monocytes_percents
      t.float :shoe
      t.float :granulocytes
      t.float :granulocytes_percents
      t.float :yuni
      t.float :reticulocytes_sticks
      t.float :segments
      t.float :eosinophils
      t.float :basophils
      t.float :reticulocytes

      t.timestamps
    end
  end
end

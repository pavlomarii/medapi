class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, index: true, null: false
      t.string :email, index: { unique: true }, null: false
      t.string :password_digest, index: true, null: false

      t.timestamps
    end
  end
end

class AddFieldsToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :latitude, :decimal, precision: 10, scale: 6
    add_column :companies, :longitude, :decimal, precision: 10, scale: 6
    add_column :companies, :address, :string
    add_column :companies, :phone, :string
    add_column :companies, :email, :string
    add_column :companies, :website, :string
    add_column :companies, :working_hours, :time, array: true, default: []

    add_index :companies, :name, unique: true
    add_index :companies, [:latitude, :longitude], unique: true
    add_index :companies, :address, unique: true
    add_index :companies, :phone, unique: true
    add_index :companies, :email, unique: true
    add_index :companies, :website, unique: true
  end
end

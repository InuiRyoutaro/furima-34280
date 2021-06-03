class AddNamesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_name_japanese, :string, null: false
    add_column :users, :first_name_japanese, :string, null: false
    add_column :users, :birth_day, :date, null: false
  end
end

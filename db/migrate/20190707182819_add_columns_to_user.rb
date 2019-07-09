class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sex, :integer
    add_column :users, :age, :integer
    add_column :users, :favorite_country, :string
    add_column :users, :country_you_want_to_go, :string
    add_column :users, :introduction, :text
  end
end

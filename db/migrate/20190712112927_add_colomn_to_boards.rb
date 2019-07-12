class AddColomnToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :country, :string
    add_column :boards, :city, :string
  end
end

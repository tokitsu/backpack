class AddFavoritesCountToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :favorites_count, :integer
  end
end

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null:false
      t.references :board, null:false

      t.timestamps
      t.index [:user_id, :board_id], unique: true
    end
  end
end

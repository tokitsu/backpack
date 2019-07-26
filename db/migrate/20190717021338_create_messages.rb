class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :conversation_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.boolean :read, null: false, default: false

      t.timestamps null: false
    end
  end
end

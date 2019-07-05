class AddUserToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :user, null:false, index: true
  end
end

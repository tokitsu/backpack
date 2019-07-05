class AddUserToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :user,null: false, index:true
  end
end

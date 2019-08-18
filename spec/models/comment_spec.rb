require 'rails_helper'

RSpec.describe Comment, type: :model do


  it "投稿があれば、コメントできる" do
    user_a = FactoryBot.create(:user , name: 'userA', email: 'user@user.com')
    board = FactoryBot.create(:board, title: 'タイトル１', body: '本文１', user:user_a)
    comment = board.comments.build(
      comment: 'コメント１'
    )
    expect(comment). to be_valid
  end

  it "紐づく投稿がなければ、投稿できない" do
    user = FactoryBot.create(:user)
    comment = user.comments.create(
      comment: 'タイトル１',
    )
    expect(comment). not_to be_valid
  end

  it "本文がなければ無効" do
    user = FactoryBot.create(:user)
    comment = user.comments.create(
      comment: '',
    )
    expect(comment). not_to be_valid
  end

end

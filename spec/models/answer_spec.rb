require 'rails_helper'

RSpec.describe Answer, type: :model do

  it "投稿があれば、コメントできる" do
    user_a = FactoryBot.create(:user , name: 'userA', email: 'user@user.com')
    question = FactoryBot.create(:question, title: 'タイトル１', body: '本文１', user:user_a)
    answer = board.comments.build(
      body: 'コメント１'
    )
    expect(answer). to be_valid
  end

  it "紐づく投稿がなければ、投稿できない" do
    user = FactoryBot.create(:user)
    answer = user.answers.create(
      body: 'タイトル１',
    )
    expect(answer). not_to be_valid
  end

  it "本文がなければ無効" do
    user = FactoryBot.create(:user)
    answer = user.answers.create(
      body: '',
    )
    expect(answer). not_to be_valid
  end

end

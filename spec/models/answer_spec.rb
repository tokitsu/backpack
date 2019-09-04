# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  body        :text(65535)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#  user_id     :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#  index_answers_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#

require 'rails_helper'

RSpec.describe Answer, type: :model do

  it "投稿があれば、コメントできる" do
    user_a = FactoryBot.create(:user , name: 'userA', email: 'user@user.com')
    question = FactoryBot.create(:question, title: 'タイトル１', body: '本文１', user:user_a)
    answer = question.answers.build(
      body: 'コメント１',
      user: user_a
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

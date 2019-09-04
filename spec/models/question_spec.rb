# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Question, type: :model do

  it "タイトル、本文があれば有効" do
    user = FactoryBot.create(:user)
    question = user.questions.create(
      title: 'タイトル１',
      body: '本文１'
    )
    expect(question). to be_valid
  end

  it "タイトルがなければ無効" do
    user = FactoryBot.create(:user)
    question = user.questions.create(
      title: '',
      body: '本文１'
    )
    expect(question). not_to be_valid
  end

  it "本文がなければ無効" do
    user = FactoryBot.create(:user)
    question = user.questions.create(
      title: 'タイトル１',
      body: ''
    )
    expect(question). not_to be_valid
  end

end

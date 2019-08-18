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

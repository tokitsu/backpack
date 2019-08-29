# == Schema Information
#
# Table name: boards
#
#  id              :integer          not null, primary key
#  body            :text(65535)
#  city            :string(255)
#  country         :string(255)
#  favorites_count :integer
#  title           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Board, type: :model do

  it "タイトル、本文があれば有効" do
    user = FactoryBot.create(:user)
    board = user.boards.create(
      title: 'タイトル１',
      body: '本文１'
    )
    expect(board). to be_valid
  end

  it "タイトルがなければ無効" do
    user = FactoryBot.create(:user)
    board = user.boards.create(
      title: '',
      body: '本文１'
    )
    expect(board). not_to be_valid
  end

  it "本文がなければ無効" do
    user = FactoryBot.create(:user)
    board = user.boards.create(
      title: 'タイトル１',
      body: ''
    )
    expect(board). not_to be_valid
  end

end

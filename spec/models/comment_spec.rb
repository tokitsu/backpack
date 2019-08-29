# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#  index_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#

require 'rails_helper'

RSpec.describe Comment, type: :model do


  it "投稿があれば、コメントできる" do
    user_a = FactoryBot.create(:user , name: 'userA', email: 'user@user.com')
    board = FactoryBot.create(:board, title: 'タイトル１', body: '本文１', user:user_a)
    comment = board.comments.build(
      comment: 'コメント１',
      user: user_a
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

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

FactoryBot.define do
  factory :board do
    title { 'テストを書く'}
    body {'ノートの中身を書く'}
  end
end

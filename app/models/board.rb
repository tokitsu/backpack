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

class Board < ApplicationRecord
  default_scope -> { order(updated_at: :desc) }
  has_many_attached :images
  has_many :comments, dependent: :delete_all
  has_many :board_tag_relations, dependent: :delete_all
  has_many :tags, through: :board_tag_relations
  has_many :favorites, dependent: :delete_all
  has_many :users, through: :favorites
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true, length: { maximum: 1000}
end

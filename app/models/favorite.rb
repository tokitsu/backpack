# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_board_id              (board_id)
#  index_favorites_on_user_id               (user_id)
#  index_favorites_on_user_id_and_board_id  (user_id,board_id) UNIQUE
#

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :board
end

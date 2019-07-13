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

class Question < ApplicationRecord
  default_scope ->{ order(updated_at: :desc) }
  has_many :answers, dependent: :delete_all
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30}
  validates :body, presence: true, length: { maximum: 1000}
end

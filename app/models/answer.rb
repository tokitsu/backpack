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

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :body, presence:true, length: {maximum: 1000}
end

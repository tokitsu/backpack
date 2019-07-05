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
  has_many :answers
  belongs_to :user
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  age                    :integer
#  country_you_want_to_go :string(255)
#  email                  :string(255)      not null
#  favorite_country       :string(255)
#  introduction           :text(65535)
#  name                   :string(255)      not null
#  password_digest        :string(255)      not null
#  sex                    :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_one_attached :image
  has_secure_password
  has_many :boards
  has_many :comments
  has_many :favorites
  has_many :fav_boards, through: :favorites, source: :board
  has_many :questions
  has_many :answers

  validates :name,
    presence: true,
    uniqueness: true,
    length: {maximum: 16}

  validates :email,
    presence: true,
    uniqueness: true,
    length: {maximum: 50}

  validates :password,
    length: {minimum: 8}

  enum sex: { 男: 0, 女: 1}

end

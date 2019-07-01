# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
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

end

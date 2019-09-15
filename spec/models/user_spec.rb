# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean          default(FALSE), not null
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

require 'rails_helper'

RSpec.describe User, type: :model do

  it "ユーザー名、メールアドレス、パスワードがあれば有効" do
    user = User.new(
      name: 'toto',
      email: 'toto@mail.com',
      password: 'totototo'
      )
    expect(user). to be_valid
  end

  it "ユーザー名がなければ無効" do
    user = User.new(
      name: '',
      email: 'toto@mail.com',
      password: 'totototo'
      )
    expect(user). not_to be_valid
  end

  it "メールアドレスがなければ無効" do
    user = User.new(
      name: 'toto',
      email: '',
      password: 'totototo'
      )
    expect(user). not_to be_valid
  end

  it "パスワードがなければ無効" do
    user = User.new(
      name: 'toto',
      email: 'toto@mail.com',
      password: ''
      )
    expect(user). not_to be_valid
  end

  it "メールアドレスが重複している場合は無効" do
    User.create(
      name: 'toto',
      email: 'toto@mail.com',
      password: 'totototo'
      )
    @user = User.new(
    name: 'momo',
    email: 'toto@mail.com',
    password: 'momomomo'
      )
    @user.valid?
    expect(@user.valid?).to eq(false)
  end


end

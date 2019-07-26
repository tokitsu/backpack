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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

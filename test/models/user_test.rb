# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :text
#  last_name       :text
#  email           :text
#  username        :text
#  password_digest :text
#  profile_picture :text
#  public_id       :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

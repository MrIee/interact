# == Schema Information
#
# Table name: puzzles
#
#  id         :integer          not null, primary key
#  title      :text
#  height     :integer
#  width      :integer
#  path       :text
#  public_id  :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PuzzleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

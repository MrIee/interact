# == Schema Information
#
# Table name: scores
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  username     :text
#  puzzle_id    :integer
#  puzzle_title :text
#  puzzle_size  :integer
#  puzzle_score :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Score < ActiveRecord::Base
    belongs_to :user
    belongs_to :puzzle
end

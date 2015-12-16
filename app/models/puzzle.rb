# == Schema Information
#
# Table name: puzzles
#
#  id         :integer          not null, primary key
#  title      :text
#  height     :integer
#  width      :integer
#  path       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Puzzle < ActiveRecord::Base
    belongs_to :user
    validates :title, :presence => true, :uniqueness => true
end

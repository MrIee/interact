# == Schema Information
#
# Table name: pieces
#
#  id         :integer          not null, primary key
#  label      :text
#  path       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Piece < ActiveRecord::Base
    belongs_to :puzzle
end

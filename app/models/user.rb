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

class User < ActiveRecord::Base
    has_secure_password
    has_many :puzzles
    has_many :scores
    validates :email, :presence => true, :uniqueness => true
    validates :first_name, :presence => true, :length => { :minimum => 2 } #minimum characters
    #validates :last_name, :presence => true, :length => { :minimum => 2 } #
    validates :username, :presence => true, uniqueness: { case_sensitive: false }, :length => { :minimum => 4, :maximum => 15 }, :format => { :with => /\A[0-9a-zA-Z|_|\-|.]*\z/, :message => "Username may only contain letters, numbers, underscores or hypens" }
    validates :profile_picture, :presence => true
end

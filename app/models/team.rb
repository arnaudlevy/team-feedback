# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  has_many :users

  def to_s
    "#{ label }"
  end

end

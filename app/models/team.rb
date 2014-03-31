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
  def value_for_indicator(indicator)
    if total_for_indicator(indicator) == 0
      0
    else
      points_for_indicator(indicator)/total_for_indicator(indicator)
    end
  end
  def points_for_indicator(indicator)
    points = 0.0
    users.each do |user|
      points += user.value_for_indicator(indicator)
    end
    points
  end
  def total_for_indicator(indicator)
    users.count
  end
  def to_s
    "#{ label }"
  end

end

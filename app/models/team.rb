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
    value = 0
    total = 0
    users.each do |user|
      value += user.value_for_indicator(indicator)
      total += 1
    end
    "#{ value }/#{ total }"
  end
  def to_s
    "#{ label }"
  end

end

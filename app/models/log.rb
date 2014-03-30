# == Schema Information
#
# Table name: logs
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  indicator_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  value        :integer
#

class Log < ActiveRecord::Base

  def self.other_value(value)
    if value == 0
      1
    else
      0
    end
  end
end

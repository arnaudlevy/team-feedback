# == Schema Information
#
# Table name: indicators
#
#  id           :integer          not null, primary key
#  label        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  label_ok     :string(255)
#  label_not_ok :string(255)
#

class Indicator < ActiveRecord::Base

  def value_for_user user
    user.value_for_indicator self
  end

  def label_for_user user
    if value_for_user(user) == 1
      label_ok
    else
      label_not_ok
    end
  end

  def to_s
    "#{ label }"
  end

end

# == Schema Information
#
# Table name: indicators
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Indicator < ActiveRecord::Base

  def to_s
    "#{ label }"
  end

end

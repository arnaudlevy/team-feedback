# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  label      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_many :users

  def to_s
    "#{ label }"
  end

end

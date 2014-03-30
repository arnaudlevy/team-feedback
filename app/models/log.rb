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
end

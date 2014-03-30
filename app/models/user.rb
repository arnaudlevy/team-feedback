# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string(255)      not null
#  crypted_password                :string(255)      not null
#  salt                            :string(255)      not null
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  team_id                         :integer
#  firstname                       :string(255)
#  lastname                        :string(255)
#  admin                           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :team
  validates :password, length: { minimum: 3 }
  validates :email, uniqueness: true

  def value_for_indicator(indicator)
    indicator = Log.where(indicator_id: indicator.id, user_id: id).last
    if indicator
      indicator.value
    else
      1 # when nothing is set, everything is ok!
    end
  end
  def admin?
    admin or id == 1
  end
  def to_s
    "#{ firstname } #{ lastname }"
  end
end

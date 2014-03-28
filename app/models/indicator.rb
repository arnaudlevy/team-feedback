class Indicator < ActiveRecord::Base

  def to_s
    "#{ label }"
  end

end

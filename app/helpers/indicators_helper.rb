module IndicatorsHelper
  def humanize_log(value)
    if (value == 0)
      'not ok'
    else
      'ok'
    end
  end

  def team_value(value)
    "#{ (value * 100).round }%"
  end
end

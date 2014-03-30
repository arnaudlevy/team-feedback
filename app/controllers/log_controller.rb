class LogController < ApplicationController
  def value
    log = Log.new
    log.indicator_id = params[:indicator_id]
    log.user_id = current_user.id
    log.value = params[:value]
    log.save
    redirect_to root_path
  end
end
class ApplicationController < ActionController::Base

  before_action :ensure_user_logged_in
  add_flash_types :info, :warning, :danger, :success

  def ensure_user_logged_in
    users_login_path unless current_user
  end

  def current_user
    debugger
    return @current_user if @current_user
    user_id = session[:current_user_id]
    if user_id
      @current_user = User.find(user_id)
      p "current_user has been updated"
      p @current_user
    else
      nil
    end
  end
end

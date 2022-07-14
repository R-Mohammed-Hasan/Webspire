class ApplicationController < ActionController::Base

  before_action :ensure_user_logged_in
  add_flash_types :info, :warning, :danger, :success

  def ensure_user_logged_in
    unless current_user
      redirect_to users_login_path
    end
  end

  def current_user
    return @current_user if @current_user
    user_id = session[:current_user_id]
    if user_id
      @current_user = User.find_by_id(user_id)
    else
      nil
    end
  end
end

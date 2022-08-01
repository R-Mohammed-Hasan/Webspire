class ApplicationController < ActionController::Base

  before_action :ensure_user_logged_in
  add_flash_types :info, :warning, :danger, :success

  def ensure_user_logged_in
    redirect_to users_login_path unless current_user
  end

  def current_user
    return @current_user if @current_user
    user_id = session[:current_user_id]
    @current_user = user_id ?  User.find(user_id) : nil
  end
end

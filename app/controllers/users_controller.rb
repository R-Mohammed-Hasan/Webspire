class UsersController < ApplicationController
  layout "users"
  skip_before_action :ensure_user_logged_in

  def sign_up
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:current_user_id] = user.id
    redirect_to root_path, success: "You have been successfully logged in"
  end
  def forgot_password
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :mobile_number)
  end
end

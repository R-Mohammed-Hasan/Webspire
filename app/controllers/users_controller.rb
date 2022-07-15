class UsersController < ApplicationController
  layout "users"
  skip_before_action :ensure_user_logged_in

  def sign_up
    @user = User.new
  end

  def create
    if User.find_by(email: params[:user][:email])
      redirect_to "/users/new", warning: "E-mail already registered...!"
      return
    end
    user = User.create(user_params)
    session[:current_user_id] = user.id
    user.user_profile.attach(io: File.open("app/assets/images/user-default-icon.png"),filename: "user-default-icon.png",content_type: "image/png")
    if user.errors.full_messages.length > 0
      redirect_to "/users/new", warning: user.errors.full_messages.join(",")
    else
      redirect_to root_path, success: "You have successfully registered"
    end
  end
  def forgot_password
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :mobile_number)
  end
end

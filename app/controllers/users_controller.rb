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
    @user = User.new
  end

  def send_mail
    @user = User.find_by(email: params[:user][:email])
    p "=================================="
    p "=================================="
    p "=================================="
p @user
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
      # This send @user as "params" to password_mailer
    end
  end

  def reset_password
      @user = User.find_signed!(params[:token],purpose: "password_reset")
      rescue ActiveSupport::MessageVerifier::InvalidSignature
          redirect_to "/users/forgotPassword", warning: "Your token has expired. Please try again..."
  end

  def update_password
    @user = User.find_signed!(params[:token],purpose: "password_reset")
    p @user
    if params[:user][:password] == params[:user][:confirm_password]
      if @user.update(password: params[:user][:password])
        redirect_to "/users/login", success: "Password has been updated successfully"
      end
    else
        redirect_to "/users/forgotPassword", warning: "Passwords does'nt match"
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :mobile_number)
  end

end

# frozen_string_literal: true

require 'open-uri'
class UsersController < ApplicationController
  layout 'users'
  skip_before_action :ensure_user_logged_in

  def sign_up
    @user = User.new
  end

  def create
    if User.find_by(email: params[:user][:email])
      redirect_to '/users/new', warning: 'E-mail already registered...!'
      return
    end
    user = User.create(user_params)
    session[:current_user_id] = user.id
    user.user_profile.attach(io: File.open('app/assets/images/user-default-icon.png'), filename: 'user-default-icon.png',
                             content_type: 'image/png')
    if user.errors.full_messages.length.positive?
      redirect_to '/users/new', warning: user.errors.full_messages.join(',')
    else
      redirect_to root_path, success: "You have been successfully registered as #{user.user_name}"
    end
  end

  def forgot_password
    @user = User.new
  end

  def send_mail
    @user = User.find_by(email: params[:user][:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
      # This send @user as "params" to password_mailer
    end
  end

  def reset_password
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to '/users/forgotPassword', warning: 'Your token has expired. Please try again...'
  end

  def update_password
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if params[:user][:password] == params[:user][:confirm_password]
      if @user.update(password: params[:user][:password])
        redirect_to '/users/login', success: 'Password has been updated successfully'
      end
    else
      redirect_to '/users/forgotPassword', warning: "Passwords does'nt match"
    end
  end

  def google_sign_up
    email = GoogleSignIn::Identity.new(flash[:google_sign_in]['id_token']).email_address
    user_profile = open(GoogleSignIn::Identity.new(flash[:google_sign_in]['id_token']).avatar_url)
    name = GoogleSignIn::Identity.new(flash[:google_sign_in]['id_token']).name.split(' ').join('_')
    given_name = GoogleSignIn::Identity.new(flash[:google_sign_in]['id_token']).family_name
    user = User.new(name: given_name, email: email, user_name: name, password: "#{name}_webspire")
    user.user_profile.attach(io: user_profile, filename: 'user-profile')
    user.save
    session[:current_user_id] = user.id
    if user.errors.full_messages.length.positive?
      redirect_to '/users/new', warning: user.errors.full_messages.join(',')
    else
      redirect_to root_path,
                  success: "You have been successfully registered as #{user.user_name}. Your password is: #{user.password}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :mobile_number)
  end
end

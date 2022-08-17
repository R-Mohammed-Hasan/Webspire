# frozen_string_literal: true

class SessionsController < ApplicationController

  skip_before_action :ensure_user_logged_in
  layout 'users'

  def login
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      session[:current_user_id] = user.id
      redirect_to root_path, success: "You have been logged in successfully as #{user.user_name}"
    else
      redirect_to users_login_path, danger: 'Invalid credentials..! Please try again'
    end
  end

  #  To sign out
  def destroy
    session.delete(:current_user_id)
    redirect_to users_login_path, success: 'You have been logged out successfully'
  end

  # ===============================================================================================

  def google_login; end

  def google_login_create
    if user = authenticate_with_google
      session[:current_user_id] = user.id
      redirect_to root_path, success: "You have been logged in successfully as #{user.user_name}"
    else
      redirect_to users_login_path, danger: 'Google Authentication error.......'
    end
  end

  private

  def authenticate_with_google
    if id_token = flash[:google_sign_in]['id_token']
      User.find_by(email: GoogleSignIn::Identity.new(id_token).email_address)
    end
  end
end

class SessionsController < ApplicationController

  skip_before_action :ensure_user_logged_in



  layout "users"



  def login

    @user = User.new

  end



  def create

    user = User.find_by(email: params[:user][:email])



    if user && user.authenticate(params[:user][:password])

      session[:current_user_id] = user.id



      redirect_to root_path, success: "You have been logged in successfully"

    else

      redirect_to users_login_path, danger: "Invalid credentials..! Please try again"

    end

  end



  #  To sign out



  def destroy

    session.delete(:current_user_id)



    redirect_to users_login_path, success: "You have been logged out successfully"

  end

end


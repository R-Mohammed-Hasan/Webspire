class ProfileController < ApplicationController
  layout "profile"

  def activity

  end

  def new_edit
      @user = User.new
      render "edit_profile"
  end

  def edit_profile
    user = User.find(@current_user.id)
    user.update(user_name: params[:user][:user_name], email: params[:user][:email],description: params[:user][:description],gender: params[:user][:gender])
    redirect_to "/profile/edit"
  end

  def edit_profile_image
    user = User.find_by_id(session[:current_user_id])
    # user.user_profile.purge
    p "params #{params[:user_profile]}"
    user.user_profile.attach(params[:user_profile])
    user.save
    redirect_to profile_edit_path,success: "Profile photo updated...!"
  end

end

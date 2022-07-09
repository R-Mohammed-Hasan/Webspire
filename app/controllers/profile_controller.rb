class ProfileController < ApplicationController
  layout "profile"

  def activity

  end

  def edit_profile
      # @user = User.new
  end

  def edit_profile_image
    user = User.find_by_id(session[:current_user_id])
    # user.user_profile.purge
    user.user_profile.attach(params[:user][:user_profile])
    user.save
    redirect_to profile_edit_path,success: "Profile photo updated...!"
  end

end

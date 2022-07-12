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
    user.update(user_name: params[:user][:user_name],name: params[:user][:name], email: params[:user][:email],description: params[:user][:description],gender: params[:user][:gender])
    redirect_to "/profile/edit"
  end

  def edit_profile_image
    user = User.find_by_id(session[:current_user_id])
    _params = params.require('user').permit(:user_profile)
    user.user_profile.attach(io: _params.to_io,filename: _params.original_filename)
    user.save
    redirect_to profile_edit_path,success: "Profile photo updated...!"
  end

  def profile
    if @current_user.id == params[:id]
      @user = @current_user
    else
      @user = User.find(params[:id])
    end
  end

  def story_create
    user =  User.find(@current_user.id)
    user.story.attach(params[:story_img])
    redirect_to root_path,success: "Story have been created successfully"
  end

  def story
    user = @current_user
    render "story",locals: {user: user}
  end

end

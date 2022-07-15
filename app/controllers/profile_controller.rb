class ProfileController < ApplicationController
  layout "profile"

  def activity
    @activities = Activity.where(sender_id: @current_user.id)
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
    user = User.find(session[:current_user_id])
    user.user_profile.purge_later
    user.user_profile.attach(io: params[:user][:user_profile].to_io,filename: params[:user][:user_profile].original_filename)
    user.save
    redirect_to profile_edit_path,success: "Profile photo updated...!"
  end

  def profile
    if @current_user.id == params[:id]
      @user = @current_user
    else
      @user = User.find(params[:id])
    end
    @posts = Post.where(user_id: params[:id])
    @request_sent = FollowRequest.where("sender_id = ? AND receiver_id = ? ",@current_user.id,@user.id)
    p @request_sent
  end

  def story_create
    user =  User.find(@current_user.id)
    user.story.purge_later
    user.story.attach(io: params[:story_img].to_io,filename: params[:story_img].original_filename)
    redirect_to root_path,success: "Story have been created successfully"
  end

  def story
    users = User.all
    p "=========================================================="
    p users[0].story
    render "story",locals: {users: users}
  end

  def request_following
      request = FollowRequest.new(sender_id: @current_user.id,receiver_id: params[:id],status: "requested")
      request.save
      redirect_to "/profile/#{params[:id]}"
  end

end

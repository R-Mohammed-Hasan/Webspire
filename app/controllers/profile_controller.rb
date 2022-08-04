class ProfileController < ApplicationController
  layout "profile"

  def activity
    @activities = Activity.where(sender_id: @current_user.id)
    @requests = FollowRequest.where(receiver_id: @current_user.id)
    notifications = Activity.where("sender_id = ? and status != ?", @current_user.id, "seen" )
    notifications.each { |notification| notification.update(status: "seen")}
  end

  def new_edit
      @user = User.new
      render "edit_profile"
  end

  def edit_profile
    user = User.find(@current_user.id)
    user.update_columns(name: params[:user][:name], email: params[:user][:email],description: params[:user][:description],gender: params[:user][:gender])
    redirect_to "/profile/edit"
  end

  def edit_profile_image
    user = User.find(@current_user.id)
    user.user_profile.purge_later
    user.user_profile.attach(io: params[:user_profile].to_io,filename: params[:user_profile].original_filename)
    user.save
    redirect_to profile_edit_path,success: "Profile photo updated...!"
  end

  def profile
    @user = @current_user.id == params[:id] ? @current_user : User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    @request_sent = FollowRequest.where("sender_id = ? AND receiver_id = ? ",@current_user.id,@user.id)
    @post = Post.new
  end

  def story_create
    user =  User.find(@current_user.id)
    user.story.purge_later
    user.story.attach(io: params[:story_img].to_io,filename: params[:story_img].original_filename, content_type: "jpg/png")
    redirect_to root_path,success: "Story have been created successfully"
  end

  def story
    friends_id = @current_user.friends
    users = friends_id.map{ |friend_id| User.find(friend_id) }
    users.unshift(@current_user) if @current_user.story.present?
    if users.length < 10
      from_webspire = User.where(id: 2...12)
      from_webspire = from_webspire.each_with_index{ |user,i| from_webspire[i].user_name = "From Webspire" }
      users += from_webspire
    end
    users = users.select{ |user| user.story.present? }
    render "story",locals: {users: users}
  end

  def delete_story
    if @current_user.id.to_s == params[:id]
      attachment = ActiveStorage::Attachment.find_by(name: "story", record_id: params[:id])
      attachment.destroy if attachment
      redirect_to "profile/stories"
    end
  end

  def request_following
    request = FollowRequest.create!(sender_id: @current_user.id,receiver_id: params[:id],status: "requested")
  end

  def unfollow
      friend = Follower.where("(user_id = ? and follower_id = ?) or (user_id = ? and follower_id = ?)", @current_user.id, params[:id], params[:id], @current_user.id)
      friend[0].destroy
      redirect_to "/profile/#{params[:id]}", success: "Friend removed from Friend List"
  end

end

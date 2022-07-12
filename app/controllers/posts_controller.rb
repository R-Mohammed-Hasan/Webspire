class PostsController < ApplicationController

  def post_create
    user = User.find(@current_user.id)
    user.posts.attach(io: params[:user][:user_post].to_io,filename: params[:user][:user_post].original_filename)
    redirect_to "/profile/#{@current_user.id}"
  end

end

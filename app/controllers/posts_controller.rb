class PostsController < ApplicationController

  def show

  end

  def post_create
    post = Post.new(user_id: @current_user.id )
    post.posts.attach(io: params[:user][:user_post].to_io,filename: params[:user][:user_post].original_filename)
    post.description = params[:user][:description]
    post.save
    redirect_to "/profile/#{@current_user.id}"
  end

  def destroy
    image = Post.find(params[:id])
    image.destroy
    redirect_to "/profile/#{current_user.id}"
  end

  def like

    respond_to do |format|

    end
  end

end

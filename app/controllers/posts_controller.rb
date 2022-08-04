class PostsController < ApplicationController

  layout "home"

  def show
      post = Post.find(params[:id])
      render "posts/show",locals: { post: post }
  end

  def post_create
    post = Post.new(user_id: @current_user.id )
    post.posts.attach(params[:user_post])
    post.description = params[:description]
    post.save
    redirect_to "/profile/#{@current_user.id}"
  end

  def edit
    post = Post.find(params[:post_id])
    post.update(post_params)
    redirect_to "/profile/#{@current_user.id}"
  end

  def destroy
    image = Post.find(params[:id])
    image.destroy
    redirect_to "/profile/#{current_user.id}"
  end

  def like
      liked = Like.find_by(user_id: @current_user.id,post_id: params[:post_id])
      if liked
        liked.destroy
      else
        _like = Like.create!(user_id: @current_user.id,post_id: params[:post_id])
        @posts = Post.where(user_id: @current_user.id)
      end
  end


  def create_comment
     @new_comment = Comment.create!(user_id: @current_user.id, post_id: params[:post_id],comment: params[:comment])
  end

  def delete_comment
      Comment.find(params[:comment_id]).destroy
  end

  private
  def post_params
      params.require(:post).permit(:description)
  end
end

# frozen_string_literal: true

class PostsController < ApplicationController
  layout "home"

  def show
    post = Post.find(params[:id])
    render "posts/show", locals: { post: post }
  end

  def post_create
    post = Post.new(user_id: @current_user.id)
    post.posts.attach(params[:user_post])
    post.description = params[:description]
    post.save
    redirect_to "/profile/#{@current_user.id}", success: "Your post has been posted"
  end

  def edit
    post = Post.find(params[:post_id])
    post.update(post_params)
    redirect_to "/profile/#{@current_user.id}"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == @current_user.id
    redirect_to "/profile/#{current_user.id}"
  end

  def like
    liked = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    if liked
      liked.destroy
    else
      _like = Like.create(user_id: @current_user.id, post_id: params[:post_id])
      _post = Post.find(params[:post_id])
      Activity.create(user_id: @current_user.id, sender_id: _post.user_id, activity: "liked your post",
        status: "not_seen")
    end
  end

  def create_comment
    @new_comment = Comment.create!(user_id: @current_user.id, post_id: params[:post_id], comment: params[:comment])
  end

  def delete_comment
    comment = Comment.find(params[:comment_id])
    comment.destroy if comment.user_id == @current_user.id
  end

  private

  def post_params
    params.require(:post).permit(:description)
  end
end

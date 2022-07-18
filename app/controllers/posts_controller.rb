class PostsController < ApplicationController

  layout "home"

  def show
      post = Post.find(params[:id])
      render "post/show",locals: {post: post}
  end

  def post_create
    post = Post.new(user_id: @current_user.id )
    post.posts.attach(io: params[:user_post].to_io,filename: params[:user_post].original_filename)
    post.description = params[:description]
    post.save
    redirect_to "/profile/#{@current_user.id}"
  end

  def edit
    post = Post.find(params[:id])
    respond_to do |format|
      format.js { render :js => "editPost(#{post})" }
      format.html{redirect_to "/profile/#{@current_user.id}"}
     end
    # redirect_to "/profile/#{params[:id]}"
  end

  def destroy
    image = Post.find(params[:id])
    image.destroy
    redirect_to "/profile/#{current_user.id}"
  end

  def like
      Like.create!(user_id: @current_user.id,post_id: params[:post_id])
      # format.json { render json: }

  end

  def dislike
      Like.find_by(user_id: @current_user.id, post_id: params[:post_id]).destroy
  end


  def posts_api
    @posts = Post.all.where(user_id: @current_user.id)
  render json: @posts
  end

end

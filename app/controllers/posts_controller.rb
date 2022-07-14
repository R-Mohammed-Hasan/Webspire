class PostsController < ApplicationController

  def show
      post = Post.find(params[:id])
      p post.id
  end

  def post_create
    post = Post.new(user_id: @current_user.id )
    post.posts.attach(io: params[:user][:user_post].to_io,filename: params[:user][:user_post].original_filename)
    post.description = params[:user][:description]
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
    respond_to do |format|
      # format.html
      format.js{render js: "console.log(hi)"}
    end
  end

end

class HomeController < ApplicationController
  layout "home"

  before_action :delete_expired_stories

  def delete_expired_stories
    stories = ActiveStorage::Attachment.where(name: "story")
    today = Time.now.strftime("%d")
    stories.each do |story|
        if story.created_at.strftime("%d") < today
          story.destroy
        end
    end
  end

  def home
    @posts = Post.all
    @users = User.all
  end

  def search
    # get user_id from db and display in url like 'users/:id'
    @search = User.where("user_name LIKE ?", "%#{params[:q]}%")
    # use description of a post to filter
  end

  def message
    @message = Chatting.new
    @friends = @current_user.friends
  end

  def new_message
      p "=================================================================== new message"
      respond_to do |format|
          format.html{ redirect_to root_path}
          format.js
      end

  end
end

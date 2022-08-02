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
    p "====================================================="
    p "====================================================="
    p "====================================================="
    p "====================================================="
    p @current_user.friends
    friends_id = @current_user.friends.map {|user| @current_user.id == user.user_id ? user.follower_id : user.user_id  }
    @users_id =
  end

  def search
    @users = User.where("user_name LIKE ? OR name LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    @posts = Post.where("description LIKE ?", "%#{params[:q]}%")
  end


end

class HomeController < ApplicationController
  layout "home"

  before_action :delete_expired_stories

  def delete_expired_stories
    stories = ActiveStorage::Attachment.where(name: "story")
    stories.each do |story|
        if Date.parse(story.created_at.strftime("%Y-%m-%d")) < Date.today
          story.destroy
        end
    end
  end

  def home
    @posts = Post.where(user_id: @current_user.friends)
    @users_id = @current_user.friends
  end

  def search
    @users = User.where("user_name LIKE ? OR name LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    @posts = Post.where("description LIKE ?", "%#{params[:q]}%")
  end


end

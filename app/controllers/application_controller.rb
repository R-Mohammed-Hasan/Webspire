class ApplicationController < ActionController::Base

  require 'Time'
  before_action :ensure_user_logged_in, :delete_expired_stories
  add_flash_types :info, :warning, :danger, :success

  def ensure_user_logged_in
    unless current_user
      redirect_to users_login_path
    end
  end

  def current_user
    return @current_user if @current_user
    user_id = session[:current_user_id]
    if user_id
      @current_user = User.find_by_id(user_id)
    else
      nil
    end
  end

  def delete_expired_stories
    stories = ActiveStorage::Attachment.where(name: "story")
    today = Time.now.strftime("%d")
    stories.each do |story|
        if story.created_at < today
          story.destroy
        end
    end
  end
end

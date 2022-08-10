# frozen_string_literal: true

class HomeController < ApplicationController
  layout 'home'

  before_action :delete_expired_stories

  def delete_expired_stories
    stories = ActiveStorage::Attachment.where(name: 'story')
    stories.each do |story|
      story.destroy if Date.parse(story.created_at.strftime('%Y-%m-%d')) < Date.today
    end
  end

  def home
    @posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 3)
    respond_to do |format|
      format.html
      format.js
    end
    @users_id = @current_user.friends
  end

  def search
    @users = User.where('user_name LIKE ? OR name LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    @posts = Post.where('description LIKE ? OR created_at LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
  end

  def searching
    users = User.ransack(user_name_cont: params[:q]).result(distinct: true)
    users = users.map do |user|
      { name: user.user_name, url: "/search?q=#{params[:q]}", icon: url_for(user.user_profile) }
    end
    posts = Post.ransack(description_cont: params[:q]).result(distinct: true).map do |post|
      { name: post.description, url: "/search?q=#{params[:q]}", icon: url_for(post.posts.first) }
    end
    render json: { users: users[0, 5], posts: posts }
  end
end
